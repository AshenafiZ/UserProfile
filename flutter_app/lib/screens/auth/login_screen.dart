import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/Button.dart';
import 'package:flutter_app/widgets/Input.dart';
import '../../services/auth_service.dart';
import '../../models/User.dart';
import 'profile_screen.dart'; 

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  final AuthService _authService = AuthService();
  bool _rememberMe = false;
  void _login() {
    // Handle login logic here
    print("Email: ${_emailController.text}, Remember Me: $_rememberMe");
  }
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
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Welcome Back", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              InputField( label: 'Email', hintText: "eg. user@gmail.com", controller: _emailController, icon: Icons.email),
              const SizedBox(height: 19),
              InputField( controller: _passwordController, label: 'Password', icon: Icons.lock, type: 'password',),
              const SizedBox(height: 12),
              Row(
                children: [
                  Checkbox(
                    value: _rememberMe,
                    onChanged: (val) => setState(() => _rememberMe = val!),
                  ),
                  const Text('Remember Me'),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Forgot Password?"),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Button(label: "Login", onPressed: _login),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      // Navigate to signup screen
                    },
                    child: const Text("Create Account"),
                  )
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}
