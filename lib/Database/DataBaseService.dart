import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todoapps/Models/ToDo.dart';
import 'package:todoapps/Models/User.dart';

class DataBaseService {
  final Firestore _dataBase = Firestore.instance;
  String uid;

  DataBaseService({this.uid});

  Future updateUserData({@required User user}) async {
    return await _dataBase.collection("users").document(user.uid).setData({
      'name': user.name,
      'email': user.email,
      'uid': user.uid,
      'imageURL': user.imageURL
    });
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
      return ToDo.fromJson(doc.data);
    }).toList();
  }

  Stream<User> get userData {
    return _dataBase
        .document(this.uid)
        .snapshots()
        .map((event) => _userDataFromSnapShot(event));
  }

  User _userDataFromSnapShot(DocumentSnapshot snapshot) {
    return User.fromJson(snapshot.data);
  }

  createTodos(
      {@required String title,
      @required String description,
      @required String uid,
      @required bool status}) {
    CollectionReference documentReference = _dataBase.collection("todos");
    String docId = _dataBase.collection("todos").document().documentID;
    ToDo toDo = ToDo(
      todoTitle: title,
      description: description,
      uid: uid,
      status: status,
      docId: docId,
      dateTime: DateTime.now(),
    );

    documentReference
        .document(docId)
        .setData(toDo.toJson())
        .whenComplete(() => print("Created"));
  }

  addTodo(ToDo toDo) {
    CollectionReference collectionReference = _dataBase.collection("todos");
    String docId;
    if (toDo.docId == null) {
      docId = _dataBase.collection("todos").document().documentID;
      toDo = toDo.copyWith(
        uid: uid,
        status: toDo.status,
        docId: docId,
      );
    }
    collectionReference
        .document(toDo.docId)
        .setData(toDo.toJson())
        .whenComplete(() => print("Created"));
  }

  updateTodo(ToDo toDo) {
    CollectionReference collectionReference = _dataBase.collection("todos");
    collectionReference.document(toDo.docId).setData(toDo.toJson());
  }

  void delete(String title) {
    DocumentReference documentReference =
        _dataBase.collection("todos").document(title);
    documentReference.delete().whenComplete(() => print("Deleted"));
  }
}
