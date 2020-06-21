import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:todoapps/Authentication/AuthService.dart';
import 'package:todoapps/Authentication/Wrapper.dart';
import 'package:todoapps/Database/DataBaseService.dart';
import 'package:todoapps/Database/ToDo.dart';
import 'package:todoapps/TextForm.dart';
import 'package:todoapps/TodoList.dart';

import 'NextPage.dart';

class Home extends StatefulWidget {
  String uid;

  Home(String uid) {
    this.uid = uid;
  }

  @override
  _HomeState createState() => _HomeState(this.uid);
}

class _HomeState extends State<Home> {
  final _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  Firestore _firestore = Firestore();
  final AuthService _authService = AuthService();
  TextEditingController todoTitleController = TextEditingController();
  TextEditingController todoDescriptionController = TextEditingController();
  DataBaseService _dataBaseService;
  var uid;

  _HomeState(var uid) {
    this.uid = uid;
    _dataBaseService = DataBaseService.name(uid);
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<ToDo>>.value(
      value: _dataBaseService.todos,
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Todo List"),
            ),
            centerTitle: true,
            backgroundColor: Colors.blue,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.power_settings_new),
                onPressed: () {
                  _auth.signOutGoogle();
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Wrapper()));
                  setState(() {});
                },
              )
            ],
          ),
          drawer: Drawer(
            child: DrawerHeader(
              child: Text("test"),
            ),
          ),
          body: TodoList(),
          floatingActionButton: new FloatingActionButton(
            onPressed: () => _floatingButtonCard(),
            backgroundColor: Colors.blue,
            child: new Icon(Icons.add),
            tooltip: "Add New List",
          ),
        ),
      ),
    );
  }

  void routeToNextPage(String title) async {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext Content) => new NextPage(title),
    ));
  }

  _floatingButtonCard() {
    return showDialog(
      context: context,
      builder: (context) => Form(
        key: _formKey,
        child: SimpleDialog(
          title: Center(child: Text("Add Todo")),
          children: <Widget>[
            textForm("Enter Todo", todoTitleController),
            textForm("Enter Description", todoDescriptionController),
            Align(
              child: RaisedButton(
                shape: StadiumBorder(),
                child: Text("Add"),
                onPressed: () {
                  _dataBaseService.createTodos(
                    todoTitleController.text,
                    todoDescriptionController.text,
                    uid,
                  );
                  todoTitleController.text = "";
                  todoDescriptionController.text = "";
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
