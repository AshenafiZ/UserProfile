import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  int _currentStep = 0;
  File? _profileImageFile;
  Uint8List? _profileImageBytes;

  final _formKey = GlobalKey<FormState>();
  // Step 1
  final firstNameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  DateTime? dob;
  String? sex;
  File? profilePhoto;

  // Step 2
  final countryCtrl = TextEditingController();
  final regionCtrl = TextEditingController();
  final cityCtrl = TextEditingController();
  final subCityCtrl = TextEditingController();
  final kebeleCtrl = TextEditingController();

  // Step 3
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final passwordCtrl2 = TextEditingController();
  final phoneCtrl = TextEditingController();

  final ImagePicker picker = ImagePicker();

  // Example form fields
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      if (kIsWeb) {
        final bytes = await picked.readAsBytes();
        setState(() => _profileImageBytes = bytes);
      } else {
        setState(() => _profileImageFile = File(picked.path));
      }
    }
  }
  bool isValidPassword(String value) {
    return RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$').hasMatch(value);
  }
  List<Step> _steps() => [
    Step(
      title: Text('Personal Info'),
      content: Column(
        children: [
          GestureDetector(
            onTap: _pickImage,
            child: CircleAvatar(
              radius: 40,
              backgroundImage: kIsWeb
                ? (_profileImageBytes != null ? MemoryImage(_profileImageBytes!) : null)
                : (_profileImageFile != null ? FileImage(_profileImageFile!) : null),
              child: (_profileImageFile == null && _profileImageBytes == null)
                  ? Icon(Icons.add_a_photo)
                  : null,
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Full Name'),
          ),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
        ],
      ),
      isActive: _currentStep >= 0,
    ),
    Step(
      title: Text('Address'),
      content: TextFormField(
        controller: addressController,
        decoration: InputDecoration(labelText: 'Address'),
      ),
      isActive: _currentStep >= 1,
    ),
    Step(
      title: Text('Account Info'),
      content: Column(
        children: [
          TextFormField(
            controller: usernameController,
            decoration: InputDecoration(labelText: 'Username'),
          ),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(labelText: 'Password'),
          ),
        ],
      ),
      isActive: _currentStep >= 2,
    ),
  ];

  void _continue() {
    if (_currentStep < _steps().length - 1) {
      setState(() => _currentStep++);
    } else {
      if (_formKey.currentState!.validate()) {
        // Handle form submission
        print('Form Submitted');
      }
    }
  }

  void _cancel() {
    if (_currentStep > 0) {
      setState(() => _currentStep--);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup Stepper'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Form(
        key: _formKey,
        child: Stepper(
          currentStep: _currentStep,
          onStepContinue: _continue,
          onStepCancel: _cancel,
          steps: _steps(),
        ),
      ),
    );
  }
}
