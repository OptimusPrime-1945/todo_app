import 'package:flutter/material.dart';
import 'package:todo_app/app/app_cubit/app_cubit.dart';
import 'package:todo_app/models/User.dart' as DataBaseUser;
import 'package:todo_app/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AppCubit appCubit;
  final AuthService authService;
  DataBaseUser.User currentUser;

  bool get isAuthenticated => currentUser != null;

  DataBaseUser.User get user => currentUser;

  AuthProvider({@required this.appCubit, @required this.authService}) {
    authService.onAuthStateChanged.listen((DataBaseUser.User newUser) {
      currentUser = newUser;
      notifyListeners();
      if (isAuthenticated) {
        appCubit.authenticated(user: currentUser);
      } else {
        appCubit.notAuthenticated(isLogin: true, msg: "Not Logged In");
      }
    });
  }

  void signInWithGoogle() async {
    appCubit.loading();
    if (!await authService.signInWithGoogle()) {
      appCubit.showError(msg: "Login Cancled");
      appCubit.notAuthenticated(isLogin: true, msg: "Not Logged In");
    } else {
      if (!await authService.loggingIn()) {
        appCubit.showError(msg: "Login Failed");
        appCubit.notAuthenticated(isLogin: true, msg: "Not Logged In");
      }
    }
  }

  Future<void> signOut() async {
    return authService.signOut();
  }
}
