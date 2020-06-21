import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapps/Database/ToDo.dart';

class DataBaseService {
  final Firestore _dataBase = Firestore.instance;

  Future<ToDo> getTodos(String uid) async {
    _dataBase
        .collection("todos")
        .document(uid)
        .snapshots()
        .map((snap) => ToDo.fromMap(snap.data));
  }

  Stream<List<ToDo>> streamToDos(FirebaseUser user) {
//      return _dataBase.collection("todos").document(user.uid).collection('collectionPath');
  }

  Future updateUserData(
      {@required String uid,
      @required String name,
      @required String email}) async {
    return await _dataBase
        .collection("users")
        .document(uid)
        .setData({'name': name, 'email': email, 'uid': uid});
  }
}
