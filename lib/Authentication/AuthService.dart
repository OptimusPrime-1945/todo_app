import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todoapps/Models/User.dart';

class AuthService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<bool> signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final AuthResult authResult =
          await _auth.signInWithCredential(credential);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future signOut() async {
    try {
      await googleSignIn.signOut();
      await _auth.signOut();
      notifyListeners();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Stream<User> get onAuthStateChanged {
    return _auth.onAuthStateChanged.map(_userFromFireBaseUser);
  }

  User _userFromFireBaseUser(FirebaseUser user) {
    return user != null
        ? User(uid: user.uid, email: user.email, name: user.displayName)
        : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFireBaseUser);
  }
}
