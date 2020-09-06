import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:todo_app/models/User.dart';
import 'package:todo_app/providers/auth_provider.dart';
import 'package:todo_app/services/data_base_service.dart';

class HomePageDrawer extends StatefulWidget {
  @override
  _HomePageDrawerState createState() => _HomePageDrawerState();
}

class _HomePageDrawerState extends State<HomePageDrawer> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<AuthProvider>(context).user;
    return WillPopScope(
      onWillPop: () async => false,
      child: StatefulBuilder(builder: (context, setState) {
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
                      backgroundImage: NetworkImage(user.photoURL),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.restore),
                  title: Text("Restore Deleted Todos"),
                  onTap: () async {
                    int count = await DataBaseService(uid: user.uid)
                        .restoreDeletedTodos();
                    Navigator.pop(context);
                    Scaffold.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                count != 0
                                    ? "Restored $count Todo(s)"
                                    : "No Todo(s) To Restore",
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.swap_horiz),
                  title: Text("Switch Theme"),
                  onTap: () => ThemeProvider.controllerOf(context).nextTheme(),
                ),
                ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text("Logout"),
                  onTap: () => Provider.of<AuthProvider>(context, listen: false)
                      .signOut(),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
