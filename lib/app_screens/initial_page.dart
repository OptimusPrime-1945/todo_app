import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Database/DataBaseService.dart';
import 'package:todo_app/app/app_bloc/app_bloc.dart';
import 'package:todo_app/app/app_bloc/bloc.dart';
import 'package:todo_app/models/User.dart';

import 'home.dart';
import 'login_screen.dart';

class InitialPage extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
        body: BlocConsumer<AppBloc, AppState>(
        listener: (context, state) {
          state.maybeWhen(
            showError: (msg) {
              _scaffoldKey.currentState
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            msg,
                            textAlign: TextAlign.center,
                          ),
                          Icon(Icons.error)
                        ],
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
              },
              orElse: () {},
            );
          },
          builder: (BuildContext context, AppState state) {
            return state.maybeWhen(
                notAuthenticated: (isLogin, msg) =>
                    LoginScreen(
                      isLogin: isLogin,
                      msg: msg,
                    ),
                authenticated: _mapToHomePage,
                orElse: () =>
                    LoginScreen(
                      isLogin: false,
                      msg: "Loading",
                    ));
          },
        ),
    );
  }

  Widget _mapToHomePage(User user) {
    DataBaseService(uid: user.uid).updateUserData(user: user);
    return Home(
      user: user,
    );
  }
}
