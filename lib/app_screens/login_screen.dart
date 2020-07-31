import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapps/providers/AuthProvider.dart';
import 'package:todoapps/widgets/loading_widget.dart';

class LoginScreen extends StatefulWidget {
  final bool isLogin;
  final String msg;

  LoginScreen({@required this.isLogin, @required this.msg});

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
            return Stack(
              children: <Widget>[
                Visibility(
                  visible: widget.isLogin ?? true,
                  child: SignIn(authProvider),
                ),
                Visibility(
                  visible: !widget.isLogin ?? false,
                  child: LoadingWidget(),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget SignIn(AuthProvider authProvider) {
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
