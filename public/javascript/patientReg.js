const form = document.getElementById("patientForm");
const message = document.getElementById("message");

form.addEventListener("submit", async function (event) {
  event.preventDefault();

  const patient = {
    patient_name: document.getElementById("patient_name").value,

    age: document.getElementById("age").value,

    gender: document.getElementById("gender").value,

    phone: document.getElementById("phone").value,

    address: document.getElementById("address").value,

    blood_group: document.getElementById("blood_group").value,

    email: document.getElementById("email").value,
  };

  try {
    const response = await fetch("http://localhost:3500/patient/register", {
      method: "POST",

      headers: {
        "Content-Type": "application/json",
      },

      body: JSON.stringify(patient),
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
    message.style.color = "red";

    message.textContent = "Unable to connect to server.";

    console.error(error);
  }
});
