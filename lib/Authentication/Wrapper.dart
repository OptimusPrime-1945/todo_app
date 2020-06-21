import 'package:flutter/material.dart';
import 'package:todoapps/Authentication/AuthService.dart';
import 'package:todoapps/Database/DataBaseService.dart';
import 'package:todoapps/home.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("TODO"),
        centerTitle: true,
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
        dynamic result = await _authService.signInWithGoogle();
        print(result.uid);
        if (result != null) {
          DataBaseService().updateUserData(
              email: result.email, name: result.displayName, uid: result.uid);
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Home(uid: result.uid)));
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
