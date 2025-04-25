const mongoose = require('mongoose');

const UserSchema = new mongoose.Schema({
  firstName: String,
  lastName: String,
  title: String,
  about: String,
  dob: Date,
  sex: { type: String, enum: ['Male', 'Female'] },
  email: { type: String, unique: true },
  phone: String,
  address: {
    country: String,
    region: String,
    city: String,
    subCity: String,
    kebele: String,
  },
  password: String,
  profilePhotoUrl: String,
  coverPhotoUrl: String,
  role: { type: String, enum: ['User', 'Admin'], default: 'User' },
  isActive: { type: Boolean, default: true },
  isEmailVerified: { type: Boolean, default: false },
  createdAt: { type: Date, default: Date.now },
  updatedAt: { type: Date, default: Date.now },
  lastLoginAt: Date,
  lastPasswordChangeAt: Date,
  lastProfileUpdateAt: Date,
  accountStatus: {
    type: String,
    enum: ['Active', 'Suspended', 'Deactivated'],
    default: 'Active',
  },
  settings: {
    language: { type: String, default: 'en' },
    theme: { type: String, enum: ['light', 'dark'], default: 'light' },
    notifications: {
      push: { type: Boolean, default: true },
      email: { type: Boolean, default: true },
      sms: { type: Boolean, default: false }
    }
  }
});

module.exports = mongoose.model('User', UserSchema);