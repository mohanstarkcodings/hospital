const departmentTable = document.getElementById("departmentTable");

async function loadDepartments() {
  try {
    const response = await fetch("http://localhost:3500/departments");

    const departments = await response.json();

    departmentTable.innerHTML = "";

    departments.forEach((department) => {
      departmentTable.innerHTML += `

                <tr>

                    <td>${department.department_id}</td>

                    <td>${department.department_name}</td>

                </tr>

            `;
    });
  } catch (error) {
    console.error(error);

    departmentTable.innerHTML = `

            <tr>

                <td colspan="2">

                    Unable to load departments.

                </td>

            </tr>

        `;
  }
}

loadDepartments();
