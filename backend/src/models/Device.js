const mongoose = require('mongoose');

const DeviceSchema = new mongoose.Schema({
  userId: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
  deviceId: String,  
  deviceName: String, 
  deviceType: String, 
  os: String,         
  ip: String,
  location: {
    country: String,
    region: String,
    city: String,
  },
  signedInAt: Date,
  signedOutAt: Date,
  isCurrent: { type: Boolean, default: false }
});

module.exports = mongoose.model('Device', DeviceSchema);
