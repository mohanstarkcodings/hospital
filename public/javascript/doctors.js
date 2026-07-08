const table = document.getElementById("doctorTable");

async function loadDoctors() {
  try {
    const response = await fetch("http://localhost:3500/doctors");

    const doctors = await response.json();

    table.innerHTML = "";

    doctors.forEach((doctor) => {
      table.innerHTML += `
                <tr>
                    <td>${doctor.doctor_name}</td>
                    <td>${doctor.department_name}</td>
                    <td>${doctor.qualification}</td>
                    <td>${doctor.experience} Years</td>
                    <td>${doctor.available_time}</td>
                    <td>${doctor.phone}</td>
                    <td>₹${doctor.consultation_fee}</td>
                </tr>
            `;
    });
  } catch (error) {
    console.log(error);
  }
}

loadDoctors();
