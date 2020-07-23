import 'package:flutter/material.dart';
import 'package:todoapps/Widgets/Loading.dart';
import 'package:todoapps/services/AuthService.dart';

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
        bool isUser= await _authService.signInWithGoogle();
        if (!isUser) loading = false;
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
