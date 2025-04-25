import 'package:flutter/material.dart';
import 'package:flutter_app/models/User.dart';
import 'package:flutter_app/services/user_service.dart';
import 'package:flutter_app/widgets/loading_spinner.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List<UserModel> _users = [];
  bool _loading = true; // Start with loading as true

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  void fetchUsers() async {
    print("start");
    
    // Fetch users
    final users = await UserService().fetchAllUsers();

    // Check if the widget is still mounted before updating the state
    if (mounted) {
      setState(() {
        _users = users;
        _loading = false; // Set loading to false once users are fetched
      });
    }

    print('${users} all users');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Users')),
      body: _loading
          ? const LoadingSpinner()
          : ListView.builder(
              itemCount: _users.length,
              itemBuilder: (context, index) {
                final user = _users[index];
                return ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(user.firstName),
                  subtitle: Text(user.email),
                  trailing: Text(user.role),
                );
              },
            ),
    );
  }
}
