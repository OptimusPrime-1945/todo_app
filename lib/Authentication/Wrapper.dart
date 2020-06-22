import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapps/Authentication/AuthService.dart';
import 'package:todoapps/Database/DataBaseService.dart';
import 'package:todoapps/Database/User.dart';
import 'package:todoapps/home.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final AuthService _authService = AuthService();
  final DataBaseService _dataBaseService = DataBaseService();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: new AppBar(
          title: Text("TODO"),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                FlutterLogo(
                  size: 50,
                ),
                SizedBox(),
                _signInButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _signInButton() {
    return OutlineButton(
      onPressed: () async {
        FirebaseUser user = await _authService.signInWithGoogle();
        if (user != null) {
          _dataBaseService.updateUserData(
              email: user.email, name: user.displayName, uid: user.uid);
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Home(User(user: user))));
        }
        return Wrapper();
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text("Sign In With Google"),
            ),
          ],
        ),
      ),
    );
  }
}
/*child: Align(
          child: RaisedButton.icon(
            icon: Icon(Icons.add),
            label: Text("Sign In With Google"),
            onPressed: () async {
              dynamic result =await _authService.signInWithGoogle();
              if(result == null ){
                print("error");
                return Wrapper();
              };
              return Home();
            },
          ),
        ),*/
