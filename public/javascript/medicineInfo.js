const medicineTable = document.getElementById("medicineTable");

async function loadMedicines() {
  try {
    const response = await fetch("http://localhost:3500/medicines");

    const medicines = await response.json();

    medicineTable.innerHTML = "";

    medicines.forEach((medicine) => {
      medicineTable.innerHTML += `

                <tr>

                    <td>${medicine.medicine_id}</td>

                    <td>${medicine.medicine_name}</td>

                    <td>₹${medicine.price}</td>

                    <td>${medicine.usage_details}</td>

                    <td>${medicine.dosage}</td>

                    <td>${medicine.stock_quantity}</td>

                </tr>

            `;
    });
  } catch (error) {
    console.log(error);

    medicineTable.innerHTML = `

            <tr>

                <td colspan="6">

                    Unable to load medicine information.

                </td>

            </tr>

        `;
  }
}

loadMedicines();
