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

  Stream<List<ToDo>> get deletedTodos {
    return FirebaseFirestore.instance
        .collection("todosDeleted")
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

  addTodo(ToDo todo) {
    todo = todo.copyWith(
      docId: (todo.docId == null
          ? _dataBase.collection("todos").doc().id
          : todo.docId),
    );
    _dataBase.collection("todosDeleted").doc(todo.docId).delete();
    _dataBase
        .collection("todos")
        .doc(todo.docId)
        .set(_toFirestoreJson(todo))
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
      addTodo(ToDo.fromJson(element.asToDo().toJson()));
    });
    return documents.docs.length;
  }

  Map<String, dynamic> _toFirestoreJson(ToDo todo) {
    var entry = todo.toJson();
    entry['createdDateTime'] = Timestamp.fromDate(todo.createdDateTime);
    entry['endingDateTime'] = Timestamp.fromDate(todo.endingDateTime);
    return entry;
  }

  restoreDeletedTodo(ToDo todo) async {
    _dataBase
        .collection("todos")
        .doc(todo.docId)
        .set(_toFirestoreJson(todo))
        .whenComplete(() => print("Added to Todos"));
    _dataBase
        .collection("todosDeleted")
        .doc(todo.docId)
        .delete()
        .whenComplete(() => print("Deleted"));
  }

  void delete(ToDo todo) {
    _dataBase
        .collection("todosDeleted")
        .doc(todo.docId)
        .set(_toFirestoreJson(todo))
        .whenComplete(() => print("Added to DeletedTodos"));
    _dataBase
        .collection("todos")
        .doc(todo.docId)
        .delete()
        .whenComplete(() => print("Deleted"));
  }

  void deleteTodoPermanently(ToDo todo) {
    _dataBase
        .collection("todosDeleted")
        .doc(todo.docId)
        .delete()
        .whenComplete(() => print("Deleted Permanetly"));
  }

  deleteTodosPermanently() async {
    QuerySnapshot querySnapshot = await _dataBase
        .collection("todosDeleted")
        .where('uid', isEqualTo: this.uid)
        .get();
    querySnapshot.docs.forEach((element) {
      deleteTodoPermanently(element.asToDo());
    });
    return querySnapshot.size;
  }
}
