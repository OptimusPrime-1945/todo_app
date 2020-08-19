import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/User.dart';
import 'package:todo_app/providers/auth_provider.dart';

class HomePageDrawer extends StatefulWidget {
  final User user;

  HomePageDrawer({@required this.user});

  @override
  _HomePageDrawerState createState() => _HomePageDrawerState();
}

class _HomePageDrawerState extends State<HomePageDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(widget.user.name),
            accountEmail: Text(widget.user.email),
            currentAccountPicture: new GestureDetector(
              child: new CircleAvatar(
                backgroundImage: NetworkImage(widget.user.imageURL),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Logout"),
            onTap: () =>
                Provider.of<AuthProvider>(context, listen: false).signOut(),
          )
        ],
      ),
    ));
  }
}
