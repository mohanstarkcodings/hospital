const express = require("express");
const { queryDatabase } = require("../../db");

const router = express.Router();

// GET /contact
router.get("/", async (req, res) => {
  try {
    const contact = await queryDatabase(`
            SELECT
                hospital_phone,
                hospital_email,
                hospital_address
            FROM contact_hospital
        `);

    res.status(200).json(contact);
  } catch (error) {
    res.status(500).json({
      message: error.message,
    });
  }
});

module.exports = router;
