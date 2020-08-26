import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/ToDo.dart';
import 'package:todo_app/models/User.dart';

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
        .orderBy("createdDateTime", descending: true)
        .snapshots()
        .map(_todosFromSnapShot);
  }

  List<ToDo> _todosFromSnapShot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return ToDo.fromJson(doc.data);
    }).toList();
  }

  Stream<ToDo> getTodo(String docId) {
    Stream<DocumentSnapshot> documentsnapshot =
        Firestore.instance.collection("todos").document(docId).get().asStream();
    return documentsnapshot.map((event) => ToDo.fromJson(event.data));
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

  addTodo(ToDo toDo) {
    CollectionReference collectionReference = _dataBase.collection("todos");
    String docId;
    if (toDo.docId == null) {
      docId = _dataBase
          .collection("todos")
          .document()
          .documentID;
      toDo = toDo.copyWith(
        uid: uid,
        status: toDo.status,
        docId: docId,
      );
    }
    if (_dataBase
        .collection("todosDeleted")
        .where("docId", isEqualTo: toDo.docId)
        .getDocuments() !=
        null) {
      _dataBase.collection("todosDeleted").document(toDo.docId).delete();
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

  restoreDeletedTodos() async {
    print("in restore");
    QuerySnapshot docs = await _dataBase
        .collection("todosDeleted")
        .where("uid", isEqualTo: this.uid)
        .getDocuments();
    docs.documents.forEach((element) {
      addTodo(ToDo.fromJson(element.data));
    });
    return docs.documents.length;
  }

  void delete(ToDo toDo) {
    DocumentReference documentReference =
    _dataBase.collection("todos").document(toDo.docId);
    if (_dataBase
        .collection("todosDeleted")
        .where("docId", isEqualTo: toDo.docId)
        .getDocuments() !=
        null) {
      _dataBase
          .collection("todosDeleted")
          .document(toDo.docId)
          .setData(toDo.toJson());
    }
    documentReference.delete().whenComplete(() => print("Deleted"));
  }
}
