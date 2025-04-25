import 'package:flutter/material.dart';
import '../../models/User.dart';

class UserDetailScreen extends StatelessWidget {
  final UserModel user;
  const UserDetailScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blueGrey, // fallback color
                  image: (user.coverPhotoUrl != null && user.coverPhotoUrl!.isNotEmpty)
                      ? DecorationImage(
                          image: NetworkImage(user.coverPhotoUrl!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
              ),

              // Profile Photo
              Positioned(
                top: 180,
                left: 0,
                right: 0,
                child: Container(
                  height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                ),
              ),

              // Profile image overlapping
              Positioned(
                top: 140,
                left: MediaQuery.of(context).size.width / 2 - 50,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 46,
                    backgroundImage: NetworkImage(user.profilePhotoUrl),
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 10,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              )
            ],
          ),
          SizedBox(height: 50),
          Text(user.firstName, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Text(user.email),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text(user.phone?? ''),
                ),
                // ListTile(
                //   leading: Icon(Icons.info),
                //   title: Text(user.bio),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
