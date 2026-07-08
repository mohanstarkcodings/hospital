const express = require("express");
const router = express.Router();

const { queryDatabase } = require("../../db");

// GET /doctors
router.get("/", async (req, res) => {
  try {
    const doctors = await queryDatabase(
      `
            SELECT
                d.doctor_id,
                u.full_name AS doctor_name,
                dp.department_name,
                d.qualification,
                d.experience,
                d.available_time,
                d.phone,
                d.consultation_fee
            FROM doctors d
            JOIN users u
                ON d.user_id = u.user_id
            JOIN departments dp
                ON d.department_id = dp.department_id
            ORDER BY u.full_name
            `,
    );

    res.status(200).json(doctors);
  } catch (error) {
    res.status(500).json({
      message: "Internal Server Error",
      error: error.message,
    });
  }
});

module.exports = router;
