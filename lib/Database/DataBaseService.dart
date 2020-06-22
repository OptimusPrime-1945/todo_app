import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todoapps/Database/ToDo.dart';

class DataBaseService {
  final Firestore _dataBase = Firestore.instance;
  String uid;

  DataBaseService.name(this.uid);

  DataBaseService();

  Future updateUserData(
      {@required String uid,
      @required String name,
      @required String email}) async {
    return await _dataBase
        .collection("users")
        .document(uid)
        .setData({'name': name, 'email': email, 'uid': uid});
  }

  Stream<List<ToDo>> get todos {
    return Firestore.instance
        .collection("todos")
        .where("uid", isEqualTo: this.uid)
        .snapshots()
        .map(_todosFromSnapShot);
  }

  List<ToDo> _todosFromSnapShot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return ToDo(
        todoTitle: doc.data['todoTitle'] ?? "No Titile",
        description: doc.data['description'] ?? "No description Mentioned",
        status: doc.data['status'] ?? false,
        uid: doc.data['uid'] ?? "",
      );
    }).toList();
  }

//  Stream<User> get user {
//    return _dataBase.collection("users").document().snapshots().map((event) =>
//        User(
//            uid: event.data['uid'],
//            name: event.data['name'],
//            email: event.data['email']));
//  }

  createTodos(String title, String descrption, String uid) {
    DocumentReference documentReference =
        _dataBase.collection("todos").document(title);
    Map<String, dynamic> todos = {
      "todoTitle": title ?? " ",
      "status": false,
      "description": descrption ?? "",
      "uid": uid,
    };
    documentReference.setData(todos).whenComplete(() => print("Created"));
  }
}
