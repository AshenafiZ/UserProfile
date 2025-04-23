const mongoose = require('mongoose');

const ProfileChangeSchema = new mongoose.Schema({
  userId: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
  field: String,      
  oldValue: String,
  newValue: String,
  changedBy: { type: mongoose.Schema.Types.ObjectId, ref: 'User' }, 
  changedAt: { type: Date, default: Date.now }
});

module.exports = mongoose.model('ProfileChange', ProfileChangeSchema);
