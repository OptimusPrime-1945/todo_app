import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todoapps/Database/ToDo.dart';
import 'package:todoapps/Database/User.dart';

class DataBaseService {
  final Firestore _dataBase = Firestore.instance;
  String uid;

  DataBaseService({this.uid});

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

  Stream<User> get userData {
    return _dataBase
        .document(this.uid)
        .snapshots()
        .map((event) => _userDataFromSnapShot(event));
  }

  User _userDataFromSnapShot(DocumentSnapshot snapshot) {
    return User(
      uid: uid,
      name: snapshot.data['name'],
      email: snapshot.data['email'],
    );
  }

  createTodos(
      {@required String title,
      @required String description,
      @required String uid,
      @required bool status}) {
    DocumentReference documentReference =
        _dataBase.collection("todos").document(title);
    Map<String, dynamic> todos = {
      "todoTitle": title ?? " ",
      "status": status,
      "description": description ?? "",
      "uid": uid,
    };
    documentReference.setData(todos).whenComplete(() => print("Created"));
  }

  void delete(String title) {
    DocumentReference documentReference =_dataBase.collection("todos").document(title);
    documentReference.delete().whenComplete(() => print("Deleted"));
  }
}
