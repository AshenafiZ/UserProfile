const User = require('../models/User');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

// Generate JWT token
const createToken = (userId) => {
  return jwt.sign({ id: userId }, process.env.JWT_SECRET, { expiresIn: '1d' });
};

// Signup 
exports.signup = async (req, res) => {
  try {
    const {
      firstName,
      lastName,
      dob,
      sex,
      email,
      phone,
      address,
      password,
      role,
      coverPhotoUrl
    } = req.body;
    // const profilePhotoUrl = req.file ? `${req.protocol}://${req.get('host')}/uploads/${req.file.filename}` : '';
    const profilePhotoUrl = req.file?.path || "" ;
    const existingUser = await User.findOne({ email });
    if (existingUser) return res.status(400).json({ message: 'Email already exists' });

    const SALT_ROUNDS = 12; 
    const hashedPassword = await bcrypt.hash(password, SALT_ROUNDS);

    const user = new User({
      firstName,
      lastName,
      dob,
      sex,
      email,
      phone,
      address,
      password: hashedPassword,
      role,
      profilePhotoUrl,
      coverPhotoUrl,
      lastPasswordChangeAt: new Date(),
      lastProfileUpdateAt: new Date(),
    });

    await user.save();

    const token = createToken(user._id);

    res.cookie('token', token, {
      httpOnly: true,
      secure: process.env.NODE_ENV === 'production',
      sameSite: 'Lax',
      maxAge: 24 * 60 * 60 * 1000
    });

    res.status(201).json({ message: 'User created successfully' , user});
  } catch (err) {
    res.status(500).json({ message: 'Error creating user', error: err.message });
  }
};

// Login
exports.login = async (req, res) => {
  try {
    const { email, password } = req.body;

    const user = await User.findOne({ email });
    if (!user) return res.status(401).json({ message: 'Invalid email or password' });

    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) return res.status(401).json({ message: 'Invalid email or password' });

    // Update last login
    user.lastLoginAt = new Date();
    await user.save();

    const token = createToken(user._id);

    res.cookie('token', token, {
      httpOnly: true,
      secure: process.env.NODE_ENV === 'production',
      sameSite: 'Lax',
      maxAge: 24 * 60 * 60 * 1000
    });

    res.status(200).json({ message: 'Login successful' });
  } catch (err) {
    res.status(500).json({ message: 'Login error', error: err.message });
  }
};

exports.logout = (req, res) => {
  res.clearCookie('token');
  res.status(200).json({ message: 'Logout successful' });
};
