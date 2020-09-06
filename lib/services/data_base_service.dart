import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/ToDo.dart';
import 'package:todo_app/models/User.dart';

class DataBaseService {
  final FirebaseFirestore _dataBase = FirebaseFirestore.instance;
  String uid;

  DataBaseService({this.uid});

  Future updateUserData({@required User user}) async {
    return await _dataBase.collection("users").doc(user.uid).set({
      'name': user.name,
      'email': user.email,
      'uid': user.uid,
      'imageURL': user.photoURL
    });
  }

  Stream<List<ToDo>> get todos {
    return FirebaseFirestore.instance
        .collection("todos")
        .where("uid", isEqualTo: this.uid)
        .orderBy("createdDateTime", descending: true)
        .snapshots()
        .map(_todosFromSnapShot);
  }

  List<ToDo> _todosFromSnapShot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) => ToDo.fromJson(doc.data())).toList();
  }

  Stream<User> get userData {
    return _dataBase
        .doc(this.uid)
        .snapshots()
        .map((event) => _userDataFromSnapShot(event));
  }

  User _userDataFromSnapShot(DocumentSnapshot snapshot) {
    return User.fromJson(snapshot.data());
  }

  addTodo(ToDo toDo) {
    CollectionReference collectionReference = _dataBase.collection("todos");
    String docId;
    if (toDo.docId == null) {
      docId = _dataBase.collection("todos").doc().id;
      toDo = toDo.copyWith(
        uid: uid,
        status: toDo.status,
        docId: docId,
      );
    }
    if (_dataBase
        .collection("todosDeleted")
        .where("docId", isEqualTo: toDo.docId)
        .get() !=
        null) {
      _dataBase.collection("todosDeleted").doc(toDo.docId).delete();
    }
    collectionReference
        .doc(toDo.docId)
        .set(toDo.toJson())
        .whenComplete(() => print("Created"));
    // GoogleCalandarServices().insertEvent(toDo);
  }

  updateTodo(ToDo toDo) {
    CollectionReference collectionReference = _dataBase.collection("todos");
    collectionReference.doc(toDo.docId).set(toDo.toJson());
  }

  restoreDeletedTodos() async {
    print("in restore");
    QuerySnapshot documents = await _dataBase
        .collection("todosDeleted")
        .where("uid", isEqualTo: this.uid)
        .get();
    documents.docs.forEach((element) {
      addTodo(ToDo.fromJson(element.data()));
    });
    return documents.docs.length;
  }

  void delete(ToDo toDo) {
    DocumentReference documentReference =
    _dataBase.collection("todos").doc(toDo.docId);
    if (_dataBase
        .collection("todosDeleted")
        .where("docId", isEqualTo: toDo.docId)
        .get() !=
        null) {
      _dataBase
          .collection("todosDeleted")
          .doc(toDo.docId)
          .set(toDo.toJson());
    }
    documentReference.delete().whenComplete(() => print("Deleted"));
  }
}
