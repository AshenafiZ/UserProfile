import 'package:flutter/material.dart';
import '../../services/api_service.dart';
import '../../services/auth_service.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  final ApiService api = ApiService();

  void login(BuildContext context) {
  //   try {
  //     final response = await api.login(emailCtrl.text, passwordCtrl.text);
  //     if (response.statusCode == 200) {
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login success!')));
  //     }
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed: $e')));
  //   }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: emailCtrl, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: passwordCtrl, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () => login(context), child: Text('Login')),
          ],
        ),
      ),
    );
  }
}
