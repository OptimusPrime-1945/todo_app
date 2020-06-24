import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapps/Database/User.dart';

class HomePageDrawer extends StatefulWidget {
  @override
  _HomePageDrawerState createState() => _HomePageDrawerState();
}

class _HomePageDrawerState extends State<HomePageDrawer> {
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
                backgroundImage: NetworkImage(
                    "https://static3.srcdn.com/wordpress/wp-content/uploads/2017/02/transformers-last-knight-optimus-prime.jpg"),
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  "https://static3.srcdn.com/wordpress/wp-content/uploads/2017/02/transformers-last-knight-optimus-prime.jpg",
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
