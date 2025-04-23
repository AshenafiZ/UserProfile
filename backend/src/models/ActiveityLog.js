const mongoose = require('mongoose');

const ActivityLogSchema = new mongoose.Schema({
  userId: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
  actionType: String,    
  message: String,      
  metadata: Object,      
  deviceId: { type: mongoose.Schema.Types.ObjectId, ref: 'Device' },
  timestamp: { type: Date, default: Date.now },
  actor: { type: mongoose.Schema.Types.ObjectId, ref: 'User' } 
});

module.exports = mongoose.model('ActivityLog', ActivityLogSchema);
