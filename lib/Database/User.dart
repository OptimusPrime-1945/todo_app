import 'package:firebase_auth/firebase_auth.dart';

class User {
  String uid;
  String name;
  String email;

  User({FirebaseUser user}) {
    this.uid = user.uid;
    this.email = user.email;
    this.name = user.displayName;
  }
}
