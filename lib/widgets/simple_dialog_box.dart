import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/models/ToDo.dart';
import 'package:todo_app/models/User.dart';
import 'package:todo_app/services/data_base_service.dart';

class SimpleDialogBox extends StatefulWidget {
  final User user;
  ToDo toDo;
  String title;

  SimpleDialogBox({@required this.user, this.toDo, this.title});

  @override
  _SimpleDialogBoxState createState() =>
      _SimpleDialogBoxState(user, toDo, title);
}

class _SimpleDialogBoxState extends State<SimpleDialogBox> {
  final _fbsKey = GlobalKey<FormBuilderState>();
  final User user;
  ToDo todo;
  String title;

  _SimpleDialogBoxState(this.user, this.todo, this.title);

  @override
  Widget build(BuildContext context) {
    if (this.todo == null) {
      this.todo = new ToDo(
          uid: user.uid, todoTitle: "", description: "", status: false);
    }
    return Container(
      child: SimpleDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        title: Center(
          child: Text(title),
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
                    initialValue: todo.todoTitle,
                    attribute: 'todoTitle',
                    validators: [
                      FormBuilderValidators.required(
                          errorText: "Enter Todo Title"),
                      FormBuilderValidators.maxLength(15,
                          errorText: "Limit Exceeded (15)")
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
                    initialValue: todo.description,
                    attribute: 'description',
                    validators: [
                      FormBuilderValidators.required(
                          errorText: "Please Enter Description"),
                    ],
                    decoration: InputDecoration(
                      labelText: "Description",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FormBuilderDateTimePicker(
                    attribute: 'endingDateTime',
                    initialValue: todo.endingDateTime,
                    inputType: InputType.both,
                    validators: [
                      FormBuilderValidators.required(),
                          (val) {
                        if (val.isBefore(DateTime.now())) {
                          return "Time Should Be Greater than present Time";
                        }
                        return null;
                      }
                    ],
                    format: DateFormat("yyyy-MM-dd HH:mm"),
                    alwaysUse24HourFormat: true,
                    decoration: InputDecoration(
                      labelText: "Appointment Time",
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
//                  ToDo entry = ToDo.fromJson(_fbsKey.currentState.value);
                  todo = ToDo(
                    todoTitle: _fbsKey.currentState.value['todoTitle'],
                    description: _fbsKey.currentState.value['description'],
                    uid: this.todo.uid,
                    docId: this.todo.docId,
                    status: todo.status,
                    createdDateTime: DateTime.now(),
                    endingDateTime:
                    _fbsKey.currentState.value['endingDateTime'],
                  );
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
