const express = require("express");
const { queryDatabase } = require("../../db.js");

const router = express.Router();

// GET /billing
router.get("/", async (req, res) => {
  try {
    const bills = await queryDatabase(`
            SELECT
                bill_id,
                appointment_id,
                consultation_fee,
                lab_test_fee,
                medicine_cost,
                room_charges,
                total_amount,
                payment_status
            FROM billing
            ORDER BY bill_id DESC
        `);

    res.status(200).json(bills);
  } catch (error) {
    res.status(500).json({
      message: error.message,
    });
  }
});

module.exports = router;
