import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app/app_cubit/app_cubit.dart';
import 'package:todo_app/models/User.dart';
import 'package:todo_app/services/data_base_service.dart';
import 'package:todo_app/widgets/loading_widget.dart';

import 'home.dart';
import 'login_screen.dart';

class InitialPage extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return Scaffold(
      key: _scaffoldKey,
      body: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("Error");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return BlocConsumer<AppCubit, AppState>(
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
                          message: msg,
                        ),
                    authenticated: _mapToHomePage,
                    orElse: () => LoginScreen(
                          isLogin: false,
                          message: "Logging in...",
                        ));
              },
            );
          }
          return LoadingWidget();
        },
      ),
    );
  }

  Widget _mapToHomePage(User user) {
    DataBaseService(uid: user.uid).updateUserData(user: user);
    return Home();
  }
}
