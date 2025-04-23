const express = require('express');
const cors = require('cors');
const cookieParser = require('cookie-parser');
const path = require('path');

module.exports = function applyMiddleware(app) {
  app.use(cors({
    origin: '*', 
    credentials: true 
  }));

  app.use(express.json());
  app.use(express.urlencoded({ extended: true }));
  app.use(cookieParser());

  app.use('/uploads', express.static(path.join(__dirname, '..', 'uploads')));
};
