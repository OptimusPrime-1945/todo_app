import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo_app/models/User.dart';

class AuthService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  AuthCredential _authCredential;

  User _userFromFireBaseUser(FirebaseUser firebaseUser) {
    return firebaseUser != null
        ? User(
            uid: firebaseUser.uid,
            email: firebaseUser.email,
            imageURL: firebaseUser.photoUrl,
            name: firebaseUser.displayName,
          )
        : null;
  }

  Stream<User> get onAuthStateChanged {
    return _auth.onAuthStateChanged.map(_userFromFireBaseUser);
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
      _authCredential = GoogleAuthProvider.getCredential(
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
