const express = require("express");
const { queryDatabase } = require("../../db.js");

const router = express.Router();

router.post("/", async (req, res) => {
  try {
    const { patient_id, doctor_id, appointment_date, appointment_time } =
      req.body;

    if (!patient_id || !doctor_id || !appointment_date || !appointment_time) {
      return res.status(400).json({
        message: "All fields are required.",
      });
    }

    await queryDatabase(
      `
            INSERT INTO appointments
            (
                patient_id,
                doctor_id,
                appointment_date,
                appointment_time
            )
            VALUES
            (?, ?, ?, ?)
            `,
      [patient_id, doctor_id, appointment_date, appointment_time],
    );

    res.status(201).json({
      message: "Appointment booked successfully.",
    });
  } catch (error) {
    res.status(500).json({
      message: error.message,
    });
  }
});

router.get("/patients", async (req, res) => {
  try {
    const patients = await queryDatabase(`
            SELECT
                p.patient_id,
                u.full_name
            FROM patients p
            JOIN users u
                ON p.user_id = u.user_id
            ORDER BY u.full_name
        `);

    res.status(200).json(patients);
  } catch (error) {
    res.status(500).json({
      message: error.message,
    });
  }
});

router.get("/departments", async (req, res) => {
  try {
    const departments = await queryDatabase(`
            SELECT *
            FROM departments
            ORDER BY department_name
        `);

    res.status(200).json(departments);
  } catch (error) {
    res.status(500).json({
      message: error.message,
    });
  }
});

router.get("/doctors/:departmentId", async (req, res) => {
  try {
    const { departmentId } = req.params;

    const doctors = await queryDatabase(
      `
            SELECT
                d.doctor_id,
                u.full_name
            FROM doctors d
            JOIN users u
                ON d.user_id = u.user_id
            WHERE d.department_id = ?
            ORDER BY u.full_name
            `,
      [departmentId],
    );

    res.status(200).json(doctors);
  } catch (error) {
    res.status(500).json({
      message: error.message,
    });
  }
});

module.exports = router;