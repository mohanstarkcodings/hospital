const billingTable = document.getElementById("billingTable");

async function loadBills() {
  try {
    const response = await fetch("http://localhost:3500/billInfo");

    const bills = await response.json();

    billingTable.innerHTML = "";

    bills.forEach((bill) => {
      billingTable.innerHTML += `

                <tr>

                    <td>${bill.bill_id}</td>

                    <td>${bill.appointment_id}</td>

                    <td>₹${bill.consultation_fee}</td>

                    <td>₹${bill.lab_test_fee}</td>

                    <td>₹${bill.medicine_cost}</td>

                    <td>₹${bill.room_charges}</td>

                    <td><strong>₹${bill.total_amount}</strong></td>

                    <td>${bill.payment_status}</td>

                </tr>

            `;
    });
  } catch (error) {
    console.log(error);

    billingTable.innerHTML = `

            <tr>

                <td colspan="8">

                    Unable to load billing information.

                </td>

            </tr>

        `;
  }
}

loadBills();
