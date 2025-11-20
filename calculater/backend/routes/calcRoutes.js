const express = require('express');
const router = express.Router();
const { calculate } = require('../controllers/calcController');

router.post('/', calculate);

module.exports = router;