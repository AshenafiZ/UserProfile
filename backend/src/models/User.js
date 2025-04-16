const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
  name: String,
  email: { type: String, unique: true },
  password: String,
  city: String,
  role: { type: String, enum: ['Admin', 'User'], default: 'User' },
  profilePicture: String,
}, { timestamps: true });

module.exports = mongoose.model('User', userSchema);
