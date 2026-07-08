const express = require("express");
const { queryDatabase } = require("../../db");

const router = express.Router();

// POST /billing
router.post("/", async (req, res) => {
  try {
    const {
      appointment_id,
      consultation_fee,
      lab_test_fee,
      medicine_cost,
      room_charges,
    } = req.body;

    if (
      !appointment_id ||
      consultation_fee === undefined ||
      lab_test_fee === undefined ||
      medicine_cost === undefined ||
      room_charges === undefined
    ) {
      return res.status(400).json({
        message: "All fields are required.",
      });
    }

    await queryDatabase(
      `
            INSERT INTO billing
            (
                appointment_id,
                consultation_fee,
                lab_test_fee,
                medicine_cost,
                room_charges
            )
            VALUES
            (?, ?, ?, ?, ?)
            `,
      [
        appointment_id,
        consultation_fee,
        lab_test_fee,
        medicine_cost,
        room_charges,
      ],
    );

    res.status(201).json({
      message: "Bill generated successfully.",
    });
  } catch (error) {
    res.status(500).json({
      message: error.message,
    });
  }
});

module.exports = router;
