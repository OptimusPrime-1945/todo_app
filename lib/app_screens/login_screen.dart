import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  final bool isLogin;
  final String message;

  LoginScreen({@required this.isLogin, @required this.message});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Consumer<AuthProvider>(
          builder:
              (BuildContext context, AuthProvider authProvider, Widget child) {
            return Center(
              child: Stack(
                children: <Widget>[
                  Visibility(
                    visible: widget.isLogin ?? true,
                    child: signIn(authProvider),
                  ),
                  Visibility(
                    visible: !widget.isLogin ?? false,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(widget.message),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget signIn(AuthProvider authProvider) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            FlutterLogo(
              size: 50,
            ),
            SizedBox(),
            OutlineButton(
              onPressed: () => authProvider.signInWithGoogle(),
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
            ),
          ],
        ),
      ),
    );
  }
}
