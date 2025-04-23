import 'package:flutter/material.dart';
import 'package:flutter_app/models/User.dart';
import 'package:flutter_app/services/user_service.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}
class _UserListScreenState extends State<UserListScreen> {
  List<UserModel> _users = [];
  bool _loading = false;

  // @override
  // void initState() {
  //   super.initState();
  //   // fetchUsers();
  // }

  void fetchUsers() async {
    print("start");
    final users = await UserService().fetchAllUsers();
    setState(() {
      _users = users;
      _loading = false;
    });
    print('${users}  dall users');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Users')),
      body: Column(
        children: [
          FloatingActionButton(onPressed: () => {fetchUsers(), ("fetching users")}),
        ],
      ),
      // body: _loading
      //     ? const Center(child: CircularProgressIndicator())
      //     : ListView.builder(
      //         itemCount: _users.length,
      //         itemBuilder: (context, index) {
      //           final user = _users[index];
      //           return ListTile(
      //             leading: const Icon(Icons.person),
      //             title: Text(user.firstName),
      //             subtitle: Text(user.email),
      //             trailing: Text(user.role),
      //           );
      //         },
      //       ),
    );
  }
}
