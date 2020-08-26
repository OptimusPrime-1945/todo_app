import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/models/ToDo.dart';
import 'package:todo_app/models/User.dart';
import 'package:todo_app/services/data_base_service.dart';

class SimpleDialogBox extends StatefulWidget {
  final User user;
  final ToDo todo;
  final String title;

  SimpleDialogBox({@required this.user, this.todo, @required this.title});

  @override
  _SimpleDialogBoxState createState() => _SimpleDialogBoxState();
}

class _SimpleDialogBoxState extends State<SimpleDialogBox> {
  final _fbsKey = GlobalKey<FormBuilderState>();


  @override
  Widget build(BuildContext context) {
    return Container(
      child: SimpleDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        title: Center(
          child: Text(widget.title),
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
                    initialValue: widget.todo != null
                        ? widget.todo.todoTitle
                        : "",
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
                    initialValue: widget.todo != null
                        ? widget.todo.description
                        : "",
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
                    initialValue: widget.todo != null ? widget.todo
                        .endingDateTime : null,
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
                  ToDo entry = ToDo(
                    todoTitle: _fbsKey.currentState.value['todoTitle'],
                    description: _fbsKey.currentState.value['description'],
                    uid: widget.user.uid,
                    docId: widget.todo != null ? widget.todo.docId : null,
                    status: widget.todo != null ? widget.todo.status : false,
                    createdDateTime: DateTime.now(),
                    endingDateTime:
                    _fbsKey.currentState.value['endingDateTime'],
                  );
                  Navigator.pop(context);
                  DataBaseService(uid: widget.user.uid).addTodo(entry);
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
