import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:todoapps/Authentication/AuthService.dart';
import 'package:todoapps/Authentication/Loading.dart';
import 'package:todoapps/Database/DataBaseService.dart';
import 'package:todoapps/Database/ToDo.dart';
import 'package:todoapps/Database/User.dart';
import 'package:todoapps/app_screens/HomePageDrawer.dart';
import 'package:todoapps/app_screens/TextForm.dart';
import 'package:todoapps/app_screens/TodoList.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  TextEditingController todoTitleController = TextEditingController();
  TextEditingController todoDescriptionController = TextEditingController();
  var user;

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    this.user = User(uid: user.uid, name: user.name, email: user.email);
    print(this.user.uid);
    return loading
        ? Loading()
        : StreamProvider<List<ToDo>>.value(
            value: DataBaseService(uid: this.user.uid).todos,
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
                    RaisedButton.icon(
                      label: Text("Logout"),
                      icon: Icon(Icons.power_settings_new),
                      onPressed: () async {
                        setState(() {
                          loading = true;
                        });
                        await _auth.signOutGoogle();
                      },
                    )
                  ],
                ),
                drawer: HomePageDrawer(),
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
      barrierDismissible: false,
      context: context,
      builder: (context) => Form(
        key: _formKey,
        child: StreamBuilder<List<ToDo>>(
          stream: DataBaseService(uid: this.user.uid).todos,
          builder: (context, snapshot) {
            return WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                title: Center(
                  child: Text("Add Todo"),
                ),
                contentPadding: EdgeInsets.all(10.0),
                children: <Widget>[
                  textForm(
                    label: "Enter Todo",
                    controller: todoTitleController,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  textForm(
                    label: "Enter Description",
                    controller: todoDescriptionController,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Align(
                    child: RaisedButton(
                      shape: StadiumBorder(),
                      child: Text("Add"),
                      onPressed: () {
                        Navigator.pop(context);
                        DataBaseService(uid: this.user.uid).createTodos(
                          title: todoTitleController.text,
                          description: todoDescriptionController.text,
                          uid: this.user.uid,
                          status: false,
                        );
                        todoTitleController.text = "";
                        todoDescriptionController.text = "";
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
