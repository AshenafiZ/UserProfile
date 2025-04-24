import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/Dropdown.dart';
import 'package:flutter_app/widgets/Input.dart';
import 'package:flutter_app/widgets/InputForm.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  int _currentStep = 0;
  File? _profileImageFile;
  Uint8List? _profileImageBytes;
  final _formKeys = [GlobalKey<FormState>(), GlobalKey<FormState>(), GlobalKey<FormState>()];

  // Step 1
  final _firstNameCtrl = TextEditingController();
  final _lastNameCtrl = TextEditingController();
  DateTime? _dob;
  String? _sex;
  File? _profilePhoto;

  // Step 2
  final _countryCtrl = TextEditingController();
  final _regionCtrl = TextEditingController();
  final _cityCtrl = TextEditingController();
  final _subCityCtrl = TextEditingController();
  final _kebeleCtrl = TextEditingController();

  // Step 3
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();

  final ImagePicker picker = ImagePicker();

  Future<void> _pickPhoto() async {
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      if(kIsWeb){
        final bytes = await pickedFile.readAsBytes();
        setState(() => _profileImageBytes = bytes);
      } else {
        setState(() => _profileImageFile = File(pickedFile.path));
      }
    }
  }

  bool isValidPassword(String value) {
    return RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$').hasMatch(value);
  }

  void onSubmit() {
    final userData = {
      "firstName": _firstNameCtrl.text.trim(),
      "lastName": _lastNameCtrl.text.trim(),
      "dob": _dob?.toIso8601String(),
      "sex": _sex,
      "profilePhoto": _profilePhoto?.path,
      "address": {
        "country": _countryCtrl.text.trim(),
        "region": _regionCtrl.text.trim(),
        "city": _cityCtrl.text.trim(),
        "subCity": _subCityCtrl.text.trim(),
        "kebele": _kebeleCtrl.text.trim(),
      },
      "email": _emailCtrl.text.trim(),
      "password": _passwordCtrl.text,
      "phone": _phoneCtrl.text.trim()
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
  List<Step> _steps() => [
    Step(
      title: Text("Personal Info"),
      isActive: _currentStep >= 0,
      content: Form(
        key: _formKeys[0],
        child: Column(
          children: [
              GestureDetector(
              onTap: _pickPhoto,
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Theme.of(context).cardColor,
                backgroundImage: kIsWeb
                  ? (_profileImageBytes != null ? MemoryImage(_profileImageBytes!) : null)
                  : (_profileImageFile != null ? FileImage(_profileImageFile!) : null),
                child:  (_profileImageFile == null && _profileImageBytes == null)
                    ? Icon(Icons.add_a_photo, color: Theme.of(context).colorScheme.onPrimary, size: 43, )
                    : null,
              ),
            ),
            InputFormField(
              label: "Fist Name", 
              controller: _firstNameCtrl,
              icon: Icons.person,
              isRequired: true,
              validator: (v) => v!.isEmpty ? 'Required' : null,
            ),
            InputFormField(
              label: "Last Name ", 
              controller: _lastNameCtrl,
              icon: Icons.person,
            ),
            Dropdown(
              items: ['Male', 'Female'].map((val) => DropdownMenuItem(value: val, child: Text(val))).toList(), 
              value: _sex, 
              onChanged: (val) => setState(() => _sex = val),
              hint: 'Select Sex',
              validator: (v) => v == null ? 'Required' : null,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22, vertical: 12),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(_dob != null ? "DOB: ${_dob!.toLocal().toString().split(' ')[0]}" : "Select DOB"),
                    IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () async {
                        DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime(2000),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (picked != null) setState(() => _dob = picked);
                      },
                    ),
                  ],
                ),
              )
            ),            
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
            TextFormField(controller: _countryCtrl, decoration: InputDecoration(labelText: 'Country'), validator: (v) => v!.isEmpty ? 'Required' : null),
            TextFormField(controller: _regionCtrl, decoration: InputDecoration(labelText: 'Region'), validator: (v) => v!.isEmpty ? 'Required' : null),
            TextFormField(controller: _cityCtrl, decoration: InputDecoration(labelText: 'City'), validator: (v) => v!.isEmpty ? 'Required' : null),
            TextFormField(controller: _subCityCtrl, decoration: InputDecoration(labelText: 'Sub City'), validator: (v) => v!.isEmpty ? 'Required' : null),
            TextFormField(controller: _kebeleCtrl, decoration: InputDecoration(labelText: 'Kebele'), validator: (v) => v!.isEmpty ? 'Required' : null),
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
              controller: _emailCtrl,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              validator: (v) {
                if (v == null || v.isEmpty) return 'Required';
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(v)) return 'Invalid email';
                return null;
              },
            ),
            const SizedBox(height: 19),
            InputFormField(
              label: "Email", 
              controller: _passwordCtrl, 
              icon: Icons.lock,
              type: "password", 
              validator: (v) {
                if (v == null || v.isEmpty) return 'Required';
                if (!isValidPassword(v)) {
                  return 'Must have upper, lower, digit, symbol, 8+ chars';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _passwordCtrl,
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
              controller: _phoneCtrl,
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
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
        backgroundColor: Color.fromARGB(211, 30, 237, 11),
      ),
      body: Stepper(
        currentStep: _currentStep,
        onStepContinue: _continue,
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() => _currentStep--);
          }
        },
        steps: _steps(),
      ),
    );
  }
}
