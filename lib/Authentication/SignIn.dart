import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapps/Authentication/AuthService.dart';
import 'package:todoapps/Authentication/Loading.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
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
          );
  }

  Widget _signInButton() {
    return OutlineButton(
      onPressed: () async {
        setState(() {
          loading = true;
        });
        FirebaseUser user = await _authService.signInWithGoogle();
        if (user == null) loading = false;
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
