import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String uid;
  String name;
  String email;
  String phoneNumber;

  User({this.name, this.email, this.phoneNumber});

  factory User.fromFireStore(DocumentSnapshot doc) {
    Map data = doc.data;
    return User();
  }
}
