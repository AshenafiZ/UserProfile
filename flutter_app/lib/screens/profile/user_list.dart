import 'package:flutter/material.dart';
import 'package:flutter_app/services/user_service.dart';
import 'package:flutter_app/widgets/loading_spinner.dart';
import '../../models/User.dart';
import 'package:flutter_app/screens/profile/user_detail.dart';
// import 'user_detail_screen.dart';

class UserListScreen extends StatefulWidget {
  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List<UserModel> _users = [];
  bool _loading = true;
  
  final service = UserService();

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  void fetchUsers() async {
    print("start");
    final users = await UserService().fetchAllUsers();
    setState(() {
      _users = users;
      _loading = false;
    });
    print('${users}  all users');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User List')),
      body: _loading
          ? LoadingSpinner()
          : ListView.builder(
        itemCount: _users.length,
        itemBuilder: (_, i) {
          final user = _users[i];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage(user.profilePhotoUrl)),
              title: Text(user.firstName),
              subtitle: Text(user.email),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => UserDetailScreen(user: user),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
