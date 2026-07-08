const express = require("express");
const { queryDatabase } = require("../../db.js");

const router = express.Router();

// Patient Registration (POST /patients/register)
router.post("/register", async (req, res) => {
  try {
    const { patient_name, age, gender, phone, address, blood_group, email } =
      req.body;

    // Validation
    if (
      !patient_name ||
      !age ||
      !gender ||
      !phone ||
      !address ||
      !blood_group ||
      !email
    ) {
      return res.status(400).json({
        message: "All fields are required.",
      });
    }

    // Check whether email already exists
    const existingUser = await queryDatabase(
      "SELECT user_id FROM users WHERE email = ?",
      [email],
    );

    if (existingUser.length > 0) {
      return res.status(409).json({
        message: "Email already exists.",
      });
    }

    // Insert into users table
    const userResult = await queryDatabase(
      `INSERT INTO users
            (full_name, email)
            VALUES (?, ?)`,
      [patient_name, email],
    );

    const userId = userResult.insertId;

    // Insert into patients table
    await queryDatabase(
      `INSERT INTO patients
            (
                user_id,
                age,
                gender,
                phone,
                address,
                blood_group
            )
            VALUES
            (?, ?, ?, ?, ?, ?)`,
      [userId, age, gender, phone, address, blood_group],
    );

    res.status(201).json({
      message: "Patient registered successfully.",
      patient_id: userId,
    });
  } catch (error) {
    console.error(error);

    res.status(500).json({
      message: "Internal Server Error",
      error: error.message,
    });
  }
});

module.exports = router;