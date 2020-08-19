import 'package:flutter/cupertino.dart';
import 'package:todo_app/app/app_bloc/bloc.dart';
import 'package:todo_app/models/User.dart';
import 'package:todo_app/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AppBloc appBloc;
  final AuthService authService;
  User currentUser;

  bool get isAuthenticated => currentUser != null;

  User get user => currentUser;

  AuthProvider({@required this.appBloc, @required this.authService}) {
    authService.onAuthStateChanged.listen((User newUser) {
      currentUser = newUser;
      notifyListeners();
      if (isAuthenticated) {
        appBloc.add(AppEvent.authenticated(currentUser));
      } else {
        appBloc.add(AppEvent.notAuthenticated());
      }
    });
  }

  void signInWithGoogle() async {
    appBloc.add(AppEvent.loading());
    if (!await authService.signInWithGoogle()) {
      appBloc.add(AppEvent.error("Login Cancled"));
      appBloc.add(AppEvent.notAuthenticated());
    } else {
      appBloc.add(AppEvent.logging());
      if (!await authService.loggingIn()) {
        appBloc.add(AppEvent.error("Login Failed"));
        appBloc.add(AppEvent.notAuthenticated());
      }
    }
  }

  Future<void> signOut() async {
    return authService.signOut();
  }
}
