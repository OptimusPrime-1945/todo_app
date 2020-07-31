import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapps/Models/User.dart';
import 'package:todoapps/app/app_bloc/app_bloc.dart';
import 'package:todoapps/app/app_bloc/bloc.dart';
import 'package:todoapps/app_screens/home.dart';

import 'login_screen.dart';

class InitialPage extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        child: BlocConsumer<AppBloc, AppState>(
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
                notAuthenticated: (isLogin, msg) => LoginScreen(
                      isLogin: isLogin,
                      msg: msg,
                    ),
                authenticated: _mapToHomePage,
                orElse: () => LoginScreen(
                      isLogin: false,
                      msg: "Loading",
                    ));
          },
        ),
      ),
    );
  }

  Widget _mapToHomePage(User user) {
    return Home(
      user: user,
    );
  }
}
