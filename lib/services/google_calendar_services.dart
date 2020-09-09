import 'dart:io';

import 'package:googleapis/calendar/v3.dart';
import "package:googleapis_auth/auth_io.dart";
import 'package:todo_app/models/ToDo.dart';
import 'package:url_launcher/url_launcher.dart';

class GoogleCalandarServices {
  static const _scope = [CalendarApi.CalendarScope];
  var _clientId;

  GoogleCalandarServices() {
    if (Platform.isAndroid) {
      _clientId = ClientId(
          "375625408870-t43ocuouurfqriig7qibe9cj2b678o48.apps.googleusercontent.com",
          "");
    } else if (Platform.isIOS) {
      _clientId = ClientId(
          "375625408870-1rusevcvqgdbec7a8mijk5vb11a751jf.apps.googleusercontent.com",
          "");
    } else {
      _clientId = ClientId(
          "375625408870-sgtmiunb9pit557hk5iidjd84lt72htt.apps.googleusercontent.com",
          "");
    }
  }

  insertEvent(ToDo toDo) {
    Event event = _todoToEvent(toDo);
    try {
      clientViaUserConsent(_clientId, _scope, prompt).then((AuthClient client) {
        String calendarId = "primary";
        CalendarApi(client).events.insert(event, calendarId).then((value) {
          if (value.status == "confirmed") {
            print('Event added in google calendar');
          } else {
            print("Unable to add event in google calendar");
          }
        });
      });
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<void> prompt(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw Exception;
    }
  }

  deleteEvent(ToDo toDo) {
    Event event = _todoToEvent(toDo);
    try {
      clientViaUserConsent(_clientId, _scope, prompt).then((AuthClient client) {
        String calendarId = "primary";
        CalendarApi(client).events.delete(event.id, calendarId).then((value) {
          if (value.status == "confirmed") {
            print('Event deleted in google calendar');
          } else {
            print("Unable to delete event in google calendar");
          }
        });
      });
    } on Exception catch (e) {
      print(e);
    }
  }

  Event _todoToEvent(ToDo toDo) {
    Event event = Event();
    event.summary = toDo.todoTitle;
    event.description = toDo.description;
    EventDateTime startEventDateTime = EventDateTime();
    startEventDateTime.timeZone = "GMT+05:30";
    startEventDateTime.dateTime = toDo.endingDateTime;
    event.start = startEventDateTime;
    EventDateTime endEventDateTime = EventDateTime();
    endEventDateTime.timeZone = "GMT+05:30";
    endEventDateTime.dateTime = toDo.endingDateTime.add(Duration(minutes: 30));
    event.end = endEventDateTime;
    return event;
  }
}
/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/ToDo.dart';
import 'package:todo_app/models/User.dart';

class DataBaseService {
  final FirebaseFirestore _dataBase = FirebaseFirestore.instance;

  // GoogleCalandarServices _googleCalandarServices = GoogleCalandarServices();
  String uid;

  DataBaseService({this.uid});

  Future updateUserData({@required User user}) async {
    return await _dataBase.collection("users").doc(user.uid).set(user.toJson());
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
    return snapshot.docs.map((doc) {
      var data = doc.data();
      data.update(
          'createdDateTime',
          (value) => DateTime.fromMicrosecondsSinceEpoch(
              data['createdDateTime'].microsecondsSinceEpoch));
      data.update(
          'endingDateTime',
          (value) => DateTime.fromMicrosecondsSinceEpoch(
              data['endingDateTime'].microsecondsSinceEpoch));
      ToDo.fromJson(data);
    }).toList();
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
    var entry = toDo.toJson();
    entry['createdDateTime'] = Timestamp.fromDate(toDo.createdDateTime);
    entry['endingDateTime'] = Timestamp.fromDate(toDo.endingDateTime);
    collectionReference
        .doc(toDo.docId)
        .set(entry)
        .whenComplete(() => print("Created"));
    // _googleCalandarServices.insertEvent(toDo);
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
      _dataBase.collection("todosDeleted").doc(toDo.docId).set(toDo.toJson());
    }
    documentReference.delete().whenComplete(() => print("Deleted"));
    // _googleCalandarServices.deleteEvent(toDo);
  }
}
*/