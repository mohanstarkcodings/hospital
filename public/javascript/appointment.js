const patient = document.getElementById("patient");
const department = document.getElementById("department");
const doctor = document.getElementById("doctor");
const form = document.getElementById("appointmentForm");
const message = document.getElementById("message");

loadPatients();
loadDepartments();

async function loadPatients() {
  const response = await fetch("http://localhost:3500/appointment/patients");

  const data = await response.json();

  patient.innerHTML = "<option value=''>Select Patient</option>";

  data.forEach((p) => {
    patient.innerHTML += `
            <option value="${p.patient_id}">
                ${p.full_name}
            </option>
        `;
  });
}

async function loadDepartments() {
  const response = await fetch(
    "http://localhost:3500/appointment/departments",
  );

  const data = await response.json();

  department.innerHTML = "<option value=''>Select Department</option>";

  data.forEach((d) => {
    department.innerHTML += `
            <option value="${d.department_id}">
                ${d.department_name}
            </option>
        `;
  });
}

department.addEventListener("change", async () => {
  const response = await fetch(
    `http://localhost:3500/appointment/doctors/${department.value}`,
  );

  const data = await response.json();

  doctor.innerHTML = "<option value=''>Select Doctor</option>";

  data.forEach((d) => {
    doctor.innerHTML += `
            <option value="${d.doctor_id}">
                ${d.full_name}
            </option>
        `;
  });
});

form.addEventListener("submit", async (e) => {
  e.preventDefault();

  const response = await fetch("http://localhost:3500/appointment", {
    method: "POST",

    headers: {
      "Content-Type": "application/json",
    },

    body: JSON.stringify({
      patient_id: patient.value,

      doctor_id: doctor.value,

      appointment_date: date.value,

      appointment_time: time.value,
    }),
  });

  const data = await response.json();

  message.textContent = data.message;

  form.reset();
});
