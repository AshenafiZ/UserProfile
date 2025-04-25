const express = require('express');
const router = express.Router();
const { register, login, logout } = require('../controllers/authController');
const upload = require('../middleware/upload');
const authenticate = require('../middleware/authenticate');

router.post('/register',upload.single('profilePhoto'), register);
router.post('/login', login);
router.post('/logout', logout);

module.exports = router;
