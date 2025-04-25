const express = require('express');
const router = express.Router();
const authenticate = require('../middleware/authenticate');
const verifyRole = require('../middleware/authMiddleware')
const {
  getAllUsers,
  getUserById,
  updateUser,
  deleteUser,
} = require('../controllers/userController');
router.get('/', getAllUsers);
router.get('/:id', getUserById);
router.put('/:id',  updateUser);
router.delete('/:id', deleteUser);

module.exports = router;
// ,authenticate, verifyRole(['Admin'])