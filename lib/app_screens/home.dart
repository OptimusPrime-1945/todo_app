import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:todoapps/Authentication/AuthService.dart';
import 'package:todoapps/Authentication/Loading.dart';
import 'package:todoapps/Database/DataBaseService.dart';
import 'package:todoapps/Models/ToDo.dart';
import 'package:todoapps/Models/User.dart';
import 'package:todoapps/app_screens/HomePageDrawer.dart';
import 'package:todoapps/app_screens/TodoList.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _auth = AuthService();
  final _fbsKey = GlobalKey<FormBuilderState>();
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
      context: context,
      builder: (context) => SimpleDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        title: Center(
          child: Text("Add Todo"),
        ),
        contentPadding: EdgeInsets.all(10.0),
        children: <Widget>[
          FormBuilder(
            key: _fbsKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FormBuilderTextField(
                    attribute: 'todoTitle',
                    validators: [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.maxLength(10,
                          errorText: "Limit Exceeded (10)")
                    ],
                    decoration: InputDecoration(
                      labelText: "Enter Todo",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FormBuilderTextField(
                    attribute: 'description',
                    validators: [FormBuilderValidators.required()],
                    decoration: InputDecoration(
                      labelText: "Description",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            child: RaisedButton(
              shape: StadiumBorder(),
              child: Text("Add"),
              onPressed: () {
                if (_fbsKey.currentState.saveAndValidate()) {
                  print(_fbsKey.currentState.value);
                  ToDo entry = ToDo.fromJson(_fbsKey.currentState.value);
                  print(entry);
                  Navigator.pop(context);
                  DataBaseService(uid: this.user.uid).addTodo(entry);
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
