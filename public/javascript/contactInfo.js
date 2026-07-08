const contactTable = document.getElementById("contactTable");

async function loadContactInformation() {
  try {
    const response = await fetch("http://localhost:3500/contactInfo");

    const contacts = await response.json();

    contactTable.innerHTML = "";

    contacts.forEach((contact) => {
      contactTable.innerHTML += `

                <tr>

                    <td>${contact.hospital_phone}</td>

                    <td>${contact.hospital_email}</td>

                    <td>${contact.hospital_address}</td>

                </tr>

            `;
    });
  } catch (error) {
    console.error(error);

    contactTable.innerHTML = `

            <tr>

                <td colspan="3">

                    Unable to load contact information.

                </td>

            </tr>

        `;
  }
}

loadContactInformation();
