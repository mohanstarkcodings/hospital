const form = document.getElementById("billingForm");

const message = document.getElementById("message");

form.addEventListener("submit", async (e) => {
  e.preventDefault();

  const bill = {
    appointment_id: document.getElementById("appointment_id").value,

    consultation_fee: document.getElementById("consultation_fee").value,

    lab_test_fee: document.getElementById("lab_test_fee").value,

    medicine_cost: document.getElementById("medicine_cost").value,

    room_charges: document.getElementById("room_charges").value,
  };

  try {
    const response = await fetch("http://localhost:3500/billing", {
      method: "POST",

      headers: {
        "Content-Type": "application/json",
      },

      body: JSON.stringify(bill),
    });

    const data = await response.json();

    if (response.ok) {
      message.style.color = "green";

      message.textContent = data.message;

      form.reset();
    } else {
      message.style.color = "red";

      message.textContent = data.message;
    }
  } catch (error) {
    console.log(error);

    message.style.color = "red";

    message.textContent = "Unable to connect to server.";
  }
});
