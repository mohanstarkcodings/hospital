const express = require("express");
const { queryDatabase } = require("../db.js");

const router = express.Router();

router.get("/", async (req, res) => {
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

module.exports = router;