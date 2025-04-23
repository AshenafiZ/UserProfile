import 'package:flutter/material.dart';
import '../../models/User.dart';

class ProfileScreen extends StatelessWidget {
  final UserModel user;

  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome ${user.firstName}")),
      body: Center(
        child: Column(
          children: [
            Image.network(user.profilePhotoUrl),
            Text(user.email),
            Text(user.firstName),
          ],
        ),
      ),
    );
  }
}
