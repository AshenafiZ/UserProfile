import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
import '../../models/User.dart';
import 'profile_screen.dart'; // Navigate after login

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  final AuthService _authService = AuthService();

  void loginUser() async {
    setState(() => isLoading = true);

    // try {
    //   final user = await _authService.login(
    //     emailController.text.trim(),
    //     passwordController.text.trim(),
    //   );

    //   if (user != null) {
    //     // Navigate to profile screen
    //     Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(builder: (_) => ProfileScreen(user: user)),
    //     );
    //   } else {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(content: Text('Login failed')),
    //     );
    //   }
    // } catch (e) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text('Error: ${e.toString()}')),
    //   );
    // }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
            TextField(controller: passwordController, decoration: InputDecoration(labelText: "Password"), obscureText: true),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: isLoading ? null : loginUser,
              child: isLoading ? CircularProgressIndicator() : Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
