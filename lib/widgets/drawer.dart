import 'package:flutter/material.dart';
import 'package:sports_app/screens/LoginScreen.dart';
import 'package:sports_app/utils/colors.dart';

class AppDrawer extends StatelessWidget {
  final String? phoneNumber;

  AppDrawer({this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Drawer Header
          UserAccountsDrawerHeader(
            accountName: phoneNumber != null
                ? Text('Phone: $phoneNumber')
                : Text('Guest'),
            accountEmail: null,
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person),
            ),
            decoration: BoxDecoration(
              color: thirdColor,
            ),
          ),
          // Log Out Button
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'Log Out',
              style: TextStyle(color: primaryColor, fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              ); // Adjust route name as needed
            },
          ),
        ],
      ),
    );
  }
}
