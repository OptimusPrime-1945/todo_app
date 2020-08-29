import 'package:flutter/material.dart';
import 'package:todo_app/app/app_cubit/app_cubit.dart';
import 'package:todo_app/models/User.dart';
import 'package:todo_app/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AppCubit appCubit;
  final AuthService authService;
  User currentUser;

  bool get isAuthenticated => currentUser != null;

  User get user => currentUser;

  AuthProvider({@required this.appCubit, @required this.authService}) {
    authService.onAuthStateChanged.listen((User newUser) {
      currentUser = newUser;
      notifyListeners();
      if (isAuthenticated) {
        appCubit.emit(AppState.authenticated(user: currentUser));
      } else {
        appCubit.emit(
            AppState.notAuthenticated(isLogin: true, msg: "Not Logged In"));
      }
    });
  }

  void signInWithGoogle() async {
    appCubit.emit(AppState.loading());
    if (!await authService.signInWithGoogle()) {
      appCubit.emit(AppState.showError(msg: "Login Cancled"));
      appCubit
          .emit(AppState.notAuthenticated(isLogin: true, msg: "Not Logged In"));
    } else {
      if (!await authService.loggingIn()) {
        appCubit.emit(AppState.showError(msg: "Login Failed"));
        appCubit.emit(
            AppState.notAuthenticated(isLogin: true, msg: "Not Logged In"));
      }
    }
  }

  Future<void> signOut() async {
    return authService.signOut();
  }
}
