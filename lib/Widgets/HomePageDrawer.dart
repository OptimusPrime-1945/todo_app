import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapps/Authentication/AuthService.dart';
import 'package:todoapps/Models/User.dart';

class HomePageDrawer extends StatefulWidget {
  @override
  _HomePageDrawerState createState() => _HomePageDrawerState();
}

class _HomePageDrawerState extends State<HomePageDrawer> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    dynamic user = Provider.of<User>(context);
    return Drawer(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(user.name),
            accountEmail: Text(user.email),
            currentAccountPicture: new GestureDetector(
              child: new CircleAvatar(
                backgroundImage: NetworkImage(user.imageURL),
              ),
            ),
          ),
          FlatButton.icon(
            label: Text("Logout"),
            icon: Icon(Icons.power_settings_new),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),
    ));
  }
}
