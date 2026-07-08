const emergencyTable = document.getElementById("emergencyTable");

async function loadEmergencyServices() {
  try {
    const response = await fetch("http://localhost:3500/eServiceInfo");

    const emergencyServices = await response.json();

    emergencyTable.innerHTML = "";

    emergencyServices.forEach((service) => {
      emergencyTable.innerHTML += `

                <tr>

                    <td>${service.emergency_phone}</td>

                    <td>${service.ambulance_service}</td>

                    <td>${service.emergency_doctor}</td>

                </tr>

            `;
    });
  } catch (error) {
    console.error(error);

    emergencyTable.innerHTML = `

            <tr>

                <td colspan="3">

                    Unable to load emergency services.

                </td>

            </tr>

        `;
  }
}

loadEmergencyServices();
