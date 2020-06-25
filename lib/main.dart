import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapps/Authentication/AuthService.dart';
import 'package:todoapps/Authentication/Wrapper.dart';
import 'package:todoapps/Models/User.dart';

void main() => runApp(TODO());

class TODO extends StatefulWidget {
  @override
  _TODOState createState() => _TODOState();
}

class _TODOState extends State<TODO> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blue,
          accentColor: Colors.blueAccent,
          buttonColor: Colors.blue,
          buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary, buttonColor: Colors.blue),
        ),
      ),
    );
  }
}
