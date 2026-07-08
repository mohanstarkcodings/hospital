const express = require("express");
const router = express.Router();

const { queryDatabase } = require("../../db");

// GET /emergency
router.get("/", async (req, res) => {
  try {
    const emergency = await queryDatabase(`
            SELECT
                emergency_phone,
                ambulance_service,
                emergency_doctor
            FROM emergency_services
        `);

    res.status(200).json(emergency);
  } catch (error) {
    res.status(500).json({
      message: error.message,
    });
  }
});

module.exports = router;