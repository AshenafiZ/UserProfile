const express = require('express');
const mongoose = require('mongoose');
const http = require('http');
const dotenv = require('dotenv');
const { Server } = require('socket.io');
const applyMiddleware = require('./src/middleware/middleware');
const authRoutes = require('./src/routes/authRoutes');
const userRoutes = require('./src/routes/userRoutes');
const errorHandler = require('./src/middleware/errorHandler');

dotenv.config();

const app = express();
const server = http.createServer(app);

const io = new Server(server, {
  cors: {
    origin: '*', 
  },
});

mongoose.connect(process.env.MONGO_CONNECTION_STRING, )
.then(() => console.log('✅ MongoDB connected'))
.catch((err) => console.error('❌ MongoDB connection error:', err));

applyMiddleware(app);

app.use('/api', authRoutes);
app.use('/api/admin', userRoutes)
app.get('/', (req, res) => {
  res.send('User Profile API running...');
});

app.use(errorHandler);

io.on('connection', (socket) => {
  console.log('A user connected');

  socket.on('disconnect', () => {
    console.log('User disconnected');
  });       
});

const PORT = process.env.PORT || 5000;
server.listen(PORT,'0.0.0.0', () => {
  console.log(`Server running on port ${PORT}`);
});
