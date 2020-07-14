import 'package:flutter/cupertino.dart';
import 'package:todoapps/Authentication/AuthService.dart';
import 'package:todoapps/Models/User.dart';
import 'package:todoapps/app/app_bloc/app_bloc.dart';
import 'package:todoapps/app/app_bloc/app_event.dart';

class AuthProvider with ChangeNotifier {
  final AppBloc appBloc;
  final AuthService authService;
  User currentUser;

  bool get isAuthenticated => currentUser != null;

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
  void signInWithGoogle()async{
    appBloc.add(AppEvent.loading());
    if(! await authService.signInWithGoogle()){
      appBloc.add(AppEvent.notAuthenticated());
    }else{
      appBloc.add(AppEvent.authenticated(currentUser));
    }
  }
  Future<void> signOut() async {
    return authService.signOut();
  }
}
