import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/ToDo.dart';
import 'package:todo_app/models/User.dart';

class DataBaseService {
  final FirebaseFirestore _dataBase = FirebaseFirestore.instance;

  // GoogleCalandarServices _googleCalandarServices = GoogleCalandarServices();
  String uid;

  DataBaseService({this.uid});

  addUser({@required User user}) async {
    DocumentSnapshot documentSnapshot =
        await _dataBase.collection('users').doc(user.uid).get();
    if (documentSnapshot.data() == null) {
      var entry = user.toJson();
      entry['registeredTime'] = Timestamp.now();
      _dataBase.collection('users').doc(user.uid).set(entry);
    }
  }

  Future updateUserData({@required User user}) {
    return _dataBase.collection("users").doc(user.uid).set(user.toJson());
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
    return snapshot.docs.map((doc) => doc?.asToDo()).toList();
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
    toDo = toDo.copyWith(
      docId: (toDo.docId == null
          ? _dataBase
          .collection("todos")
          .doc()
          .id
          : toDo.docId),
    );
    _dataBase.collection("todosDeleted").doc(toDo.docId).delete();
    var entry = toDo.toJson();
    entry['createdDateTime'] = Timestamp.fromDate(toDo.createdDateTime);
    entry['endingDateTime'] = Timestamp.fromDate(toDo.endingDateTime);
    _dataBase
        .collection("todos")
        .doc(toDo.docId)
        .set(entry)
        .whenComplete(() => print("Created"));
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
    _dataBase
        .collection("todosDeleted")
        .doc(toDo.docId)
        .set(toDo.toJson())
        .whenComplete(() => print("Added to DeletedTodos"));
    _dataBase
        .collection("todos")
        .doc(toDo.docId)
        .delete()
        .whenComplete(() => print("Deleted"));
  }
}
