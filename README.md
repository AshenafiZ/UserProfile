# 🧑‍💼 User Profile App

The **User Profile App** is a cross-platform solution for managing user profiles with role-based access control, built with a Flutter frontend and Node.js (Express) backend. The app supports full CRUD functionality, JWT authentication, profile picture uploads, QR code generation/scanning, and real-time updates using WebSockets.

---

## 📦 Tech Stack

- **Frontend**: Flutter
- **Backend**: Node.js + Express
- **Authentication**: JWT (JSON Web Token)
- **Database**: MongoDB 
- **File Upload**: Multer
- **Real-Time**: Socket.IO
- **QR Code**: qr_flutter (Flutter), qrcode (backend)
- **State Management**: Provider (Flutter)
- **Storage**: flutter_secure_storage (for JWT)

---

## ✅ Features

### 🔐 Authentication
- User Registration & Login
- JWT Token Authentication
- Role-based Access Control (Admin/User)
- Secure password hashing

### 👤 Profile Management (CRUD)
- Create, Read, Update, and Delete user profiles
- Admin can manage all users
- Users can only edit their own data

### 🖼 Profile Picture
- Upload and display profile photos
- Image stored and accessible via URL

### 📡 Real-Time Updates 
- Auto-refresh data on profile updates using WebSocket

### 🔍 Search
- Filter users by name or email

### 🌗 Light/Dark Mode
- Theming support for better UX

### 📷 QR Code Integration
- Generate QR code for user profile
- Scan QR to retrieve user data (with a dedicated screen)
