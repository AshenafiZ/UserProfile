import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/Button.dart';
import 'package:image_picker/image_picker.dart';

class MultiStepSignupForm extends StatefulWidget {
  @override
  _MultiStepSignupFormState createState() => _MultiStepSignupFormState();
}

class _MultiStepSignupFormState extends State<MultiStepSignupForm> {
  int _currentStep = 0;
  File? _imageFile;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController firstNameCtrl = TextEditingController();
  final TextEditingController lastNameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  final TextEditingController cityCtrl = TextEditingController();
  final TextEditingController phoneCtrl = TextEditingController();

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _imageFile = File(picked.path);
      });
    }
  }

  void _onStepContinue() {
    if (_currentStep < 2) {
      setState(() {
        _currentStep++;
      });
    } else {
      if (_formKey.currentState!.validate()) {
        // Submit the form here
        print("Form submitted!");
        print("First Name: ${firstNameCtrl.text}");
        print("Last Name: ${lastNameCtrl.text}");
        print("Email: ${emailCtrl.text}");
        // etc...
      }
    }
  }

  void _onStepCancel() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Signup")),
      body: Form(
        key: _formKey,
        child: Stepper(
          type: StepperType.horizontal,
          currentStep: _currentStep,
          onStepContinue: _onStepContinue,
          onStepCancel: _onStepCancel,
          steps: [
            Step(
              title: Text("Step 1"),
              isActive: _currentStep >= 0,
              content: Column(
                children: [
                  GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: _imageFile != null ? FileImage(_imageFile!) : null,
                      child: _imageFile == null ? Icon(Icons.camera_alt) : null,
                    ),
                  ),
                  TextFormField(
                    controller: firstNameCtrl,
                    decoration: InputDecoration(labelText: 'First Name'),
                    validator: (value) => value!.isEmpty ? 'Required' : null,
                  ),
                  TextFormField(
                    controller: lastNameCtrl,
                    decoration: InputDecoration(labelText: 'Last Name'),
                    validator: (value) => value!.isEmpty ? 'Required' : null,
                  ),
                ],
              ),
            ),
            Step(
              title: Text("Step 2"),
              isActive: _currentStep >= 1,
              content: Column(
                children: [
                  TextFormField(
                    controller: emailCtrl,
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: (value) => value!.contains('@') ? null : 'Invalid email',
                  ),
                  TextFormField(
                    controller: passwordCtrl,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    validator: (value) => value!.length >= 6 ? null : 'Min 6 characters',
                  ),
                ],
              ),
            ),
            Step(
              title: Text("Step 3"),
              isActive: _currentStep >= 2,
              content: Column(
                children: [
                  TextFormField(
                    controller: cityCtrl,
                    decoration: InputDecoration(labelText: 'City'),
                  ),
                  TextFormField(
                    controller: phoneCtrl,
                    decoration: InputDecoration(labelText: 'Phone Number'),
                    keyboardType: TextInputType.phone,
                  ),
                  customButton(context: context, text: "Submit", onPressed: (){}, backgroundColor: Colors.blue)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
