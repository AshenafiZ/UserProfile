const express = require('express');
const router = express.Router();
const { signup, login, logout } = require('../controllers/authController');
const upload = require('../middleware/upload')

router.post('/signup',upload.single('profilePhoto'), signup);
router.post('/login', login);
router.post('/logout', logout);

module.exports = router;
