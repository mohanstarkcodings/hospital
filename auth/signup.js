const express = require("express");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcrypt");
const { queryDatabase } = require("../db");
const CustomError = require("../utils/CustomError.js");

const router = express.Router();

router.post("/", async (req, res) => {
  try {
    const { full_name ,email, password } = req.body;

    if (!full_name || !email || !password) {
      return res.status(400).json({
        message: "All fields are required",
      });
    }

    const existingUser = await queryDatabase(
      "SELECT user_id FROM users WHERE email = ?",
      [email],
    );

    if (existingUser.length > 0) {
      return res.status(409).json({
        message: "Email already registered",
      });
    }

    const hashedPassword = await bcrypt.hash(password, 10);

    const result = await queryDatabase(
      `
      INSERT INTO users
      (
      full_name ,
        email,
        password_hash,
        role,
        provider
      )
      VALUES
      (
        ?,
        ?,
        ?,
        'patient',
        'local'
      )
      `,
      [full_name, email, hashedPassword],
    );

    const token = jwt.sign(
      {
        id: result.insertId,
        email,
        role: "patient",
      },
      process.env.JWT_SECRET,
      {
        expiresIn: "1h",
      },
    );

    res.status(201).json({
      message: "Account created successfully",
      token,
      user: {
        id: result.insertId,
        email,
        role: "Patient",
      },
    });
  } catch (error) {
    console.error(error);
    next(new CustomError("Signup failed", 500));
  }
});

module.exports = router;