import 'package:flutter/material.dart';

class UserProfileFromQR extends StatelessWidget {
  final Map<String, dynamic> data;

  const UserProfileFromQR({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text("Name: ${data['name']}", style: Theme.of(context).textTheme.titleLarge),
              Text("Email: ${data['email']}"),
              Text("Phone: ${data['phone']}"),
              Text("Role: ${data['role']}"),
              // Add more fields as needed
            ],
          ),
        ),
      ),
    );
  }
}
