const mongoose = require('mongoose');

const AdminActionSchema = new mongoose.Schema({
  adminId: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
  targetUserId: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
  action: String,     
  details: Object,   
  timestamp: { type: Date, default: Date.now }
});

module.exports = mongoose.model('AdminAction', AdminActionSchema);
