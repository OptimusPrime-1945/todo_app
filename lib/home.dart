import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:todoapps/Authentication/AuthService.dart';
import 'package:todoapps/Authentication/Wrapper.dart';
import 'package:todoapps/Database/DataBaseService.dart';
import 'package:todoapps/Database/ToDo.dart';
import 'package:todoapps/TextForm.dart';
import 'package:todoapps/TodoList.dart';

class Home extends StatefulWidget {


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  TextEditingController todoTitleController = TextEditingController();
  TextEditingController todoDescriptionController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<ToDo>>.value(
      value: DataBaseService().todos,
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
          //drawer: Drawer(
          //child: DrawerHeader(
          // child: Text(this._user.name),

          //),
          //),
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


  _floatingButtonCard() {
    return showDialog(
      context: context,
      builder: (context) => Form(
        key: _formKey,
        child: StreamBuilder<List<ToDo>>(
            stream: DataBaseService().todos,
            builder: (context, snapshot) {
              return SimpleDialog(
                title: Center(child: Text("Add Todo")),
                children: <Widget>[
                  textForm("Enter Todo", todoTitleController),
                  textForm("Enter Description", todoDescriptionController),
                  Align(
                    child: RaisedButton(
                      shape: StadiumBorder(),
                      child: Text("Add"),
                      onPressed: () {
                        DataBaseService().createTodos(
                          title: todoTitleController.text,
                          description: todoDescriptionController.text,
                          uid: DataBaseService().uid,
                          status: false,
                        );
                        todoTitleController.text = "";
                        todoDescriptionController.text = "";
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
