import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo_app/models/User.dart' as DataBaseUser;

class AuthService with ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  AuthCredential _authCredential;

  DataBaseUser.User _userFromFireBaseUser(User user) {
    return user != null ? user.asUser() : null;
  }

  Stream<DataBaseUser.User> get onAuthStateChanged {
    return _auth.authStateChanges().map(_userFromFireBaseUser);
  }

  Future signOut() async {
    try {
      _auth.signOut();
      _googleSignIn.signOut();
      notifyListeners();
    } catch (e) {
      debugPrint(e);
    }
  }

  Future<bool> signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      _authCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> loggingIn() async {
    try {
      await _auth.signInWithCredential(_authCredential);
      notifyListeners();
      return true;
    } catch (e) {
      notifyListeners();
      return false;
    }
  }

  void googleSignOut() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
