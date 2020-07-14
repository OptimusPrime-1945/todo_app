import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapps/Database/DataBaseService.dart';
import 'package:todoapps/app_screens/Authenticate.dart';
import 'package:todoapps/Models/User.dart';
import 'package:todoapps/app_screens/home.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null)
      return Authenticate();
    else {
      DataBaseService(uid: user.uid).updateUserData(
        uid: user.uid,
        name: user.name,
        email: user.email,
      );
      return Home();
    }
  }
}
