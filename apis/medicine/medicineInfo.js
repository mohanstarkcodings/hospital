const express = require("express");
const router = express.Router();

const { queryDatabase } = require("../../db.js");

// GET /medicines
router.get("/", async (req, res) => {
  try {
    const medicines = await queryDatabase(`
            SELECT
                medicine_id,
                medicine_name,
                price,
                usage_details,
                dosage,
                stock_quantity
            FROM medicines
            ORDER BY medicine_name
        `);

    res.status(200).json(medicines);
  } catch (error) {
    res.status(500).json({
      message: error.message,
    });
  }
});

module.exports = router;