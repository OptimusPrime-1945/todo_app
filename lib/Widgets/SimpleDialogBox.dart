import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:todoapps/Authentication/AuthService.dart';
import 'package:todoapps/Database/DataBaseService.dart';
import 'package:todoapps/Models/ToDo.dart';
import 'package:todoapps/Models/User.dart';

class SimpleDialogBox extends StatefulWidget {
  final User user;
  ToDo toDo;
  SimpleDialogBox({ @required this.user, this.toDo});

  @override
  _SimpleDialogBoxState createState() => _SimpleDialogBoxState(user,toDo);
}

class _SimpleDialogBoxState extends State<SimpleDialogBox> {
  final _fbsKey = GlobalKey<FormBuilderState>();
  final User user;
  ToDo todo;

  _SimpleDialogBoxState(this.user, this.todo);

  @override
  Widget build(BuildContext context) {
    if(this.todo == null){
      this.todo =new ToDo(uid: user.uid,todoTitle: " ",description: " ",status: false);
    }
    print(todo);
    return Container(
      child: SimpleDialog(
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
                    initialValue: todo.todoTitle ?? " ",
                    attribute: 'todoTitle' ,
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
                  initialValue: todo.description ?? " ",
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
                  ToDo entry= ToDo.fromJson(_fbsKey.currentState.value);
                  print(todo);
                  print(this.todo.docId);
                  todo= entry.copyWith(uid :this.todo.uid,docId:this.todo.docId,status:todo.status);
                  print(todo);
                  Navigator.pop(context);
                  DataBaseService(uid: user.uid).addTodo(todo);
                }
              },
            ),
          )
        ],
      ),
    );
  }
}