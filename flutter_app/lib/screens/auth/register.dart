import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  int _currentStep = 0;
  final _formKeys = [GlobalKey<FormState>(), GlobalKey<FormState>(), GlobalKey<FormState>()];

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
  final phoneCtrl = TextEditingController();

  final ImagePicker picker = ImagePicker();

  Future<void> pickPhoto() async {
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        profilePhoto = File(pickedFile.path);
      });
    }
  }

  bool isValidPassword(String value) {
    return RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$').hasMatch(value);
  }

  void onSubmit() {
    final userData = {
      "firstName": firstNameCtrl.text.trim(),
      "lastName": lastNameCtrl.text.trim(),
      "dob": dob?.toIso8601String(),
      "sex": sex,
      "profilePhoto": profilePhoto?.path,
      "address": {
        "country": countryCtrl.text.trim(),
        "region": regionCtrl.text.trim(),
        "city": cityCtrl.text.trim(),
        "subCity": subCityCtrl.text.trim(),
        "kebele": kebeleCtrl.text.trim(),
      },
      "email": emailCtrl.text.trim(),
      "password": passwordCtrl.text,
      "phone": phoneCtrl.text.trim()
    };

    print("✅ Submitted user: $userData");
    // Call your API here
  }

  void _continue() {
    if (_formKeys[_currentStep].currentState!.validate()) {
      if (_currentStep < 2) {
        setState(() => _currentStep++);
      } else {
        onSubmit();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Signup')),
      body: Stepper(
        currentStep: _currentStep,
        onStepContinue: _continue,
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() => _currentStep--);
          }
        },
        steps: [
          Step(
            title: Text("Personal Info"),
            isActive: _currentStep >= 0,
            content: Form(
              key: _formKeys[0],
              child: Column(
                children: [
                  TextFormField(
                    controller: firstNameCtrl,
                    decoration: InputDecoration(labelText: 'First Name'),
                    validator: (v) => v!.isEmpty ? 'Required' : null,
                  ),
                  TextFormField(
                    controller: lastNameCtrl,
                    decoration: InputDecoration(labelText: 'Last Name'),
                    validator: (v) => v!.isEmpty ? 'Required' : null,
                  ),
                  Row(
                    children: [
                      Text(dob != null ? "DOB: ${dob!.toLocal().toString().split(' ')[0]}" : "Select DOB"),
                      IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () async {
                          DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime(2000),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );
                          if (picked != null) setState(() => dob = picked);
                        },
                      ),
                    ],
                  ),
                  if (dob == null) Text('Date of birth required', style: TextStyle(color: Colors.red)),
                  DropdownButtonFormField<String>(
                    value: sex,
                    items: ['Male', 'Female'].map((val) => DropdownMenuItem(value: val, child: Text(val))).toList(),
                    hint: Text("Select Sex"),
                    onChanged: (val) => setState(() => sex = val),
                    validator: (v) => v == null ? 'Required' : null,
                  ),
                  SizedBox(height: 10),
                  profilePhoto != null
                      ? Image.file(profilePhoto!, height: 100)
                      : Text("No photo selected"),
                  ElevatedButton(onPressed: pickPhoto, child: Text("Choose Photo")),
                ],
              ),
            ),
          ),
          Step(
            title: Text("Address Info"),
            isActive: _currentStep >= 1,
            content: Form(
              key: _formKeys[1],
              child: Column(
                children: [
                  TextFormField(controller: countryCtrl, decoration: InputDecoration(labelText: 'Country'), validator: (v) => v!.isEmpty ? 'Required' : null),
                  TextFormField(controller: regionCtrl, decoration: InputDecoration(labelText: 'Region'), validator: (v) => v!.isEmpty ? 'Required' : null),
                  TextFormField(controller: cityCtrl, decoration: InputDecoration(labelText: 'City'), validator: (v) => v!.isEmpty ? 'Required' : null),
                  TextFormField(controller: subCityCtrl, decoration: InputDecoration(labelText: 'Sub City'), validator: (v) => v!.isEmpty ? 'Required' : null),
                  TextFormField(controller: kebeleCtrl, decoration: InputDecoration(labelText: 'Kebele'), validator: (v) => v!.isEmpty ? 'Required' : null),
                ],
              ),
            ),
          ),
          Step(
            title: Text("Account Info"),
            isActive: _currentStep >= 2,
            content: Form(
              key: _formKeys[2],
              child: Column(
                children: [
                  TextFormField(
                    controller: emailCtrl,
                    decoration: InputDecoration(labelText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (v) {
                      if (v == null || v.isEmpty) return 'Required';
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(v)) return 'Invalid email';
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: passwordCtrl,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    validator: (v) {
                      if (v == null || v.isEmpty) return 'Required';
                      if (!isValidPassword(v)) {
                        return 'Must have upper, lower, digit, symbol, 8+ chars';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: phoneCtrl,
                    decoration: InputDecoration(labelText: 'Phone'),
                    keyboardType: TextInputType.phone,
                    validator: (v) {
                      if (v == null || v.isEmpty) return 'Required';
                      if (!RegExp(r'^\+?[0-9]{7,15}$').hasMatch(v)) return 'Invalid phone';
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
