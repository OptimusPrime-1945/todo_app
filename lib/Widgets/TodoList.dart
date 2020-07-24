import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todoapps/Database/DataBaseService.dart';
import 'package:todoapps/Models/ToDo.dart';
import 'package:todoapps/Models/User.dart';
import 'package:todoapps/Widgets/SimpleDialogBox.dart';

class TodoList extends StatefulWidget {
  bool pending;

  TodoList({@required this.pending});

  @override
  _TodoListState createState() => _TodoListState(pending: this.pending);
}

class _TodoListState extends State<TodoList> {
  DataBaseService _dataBaseService;
  bool isStatus;
  bool pending;

  _TodoListState({@required this.pending});

  @override
  Widget build(BuildContext context) {
    final todos = Provider.of<List<ToDo>>(context);
    if (todos != null)
      return ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return _listItemBuilder(context, todos[index]);
        },
      );
    else
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          Text("Loading Please wait"),
        ],
      );
  }

  Widget _listItemBuilder(BuildContext context, ToDo todo) {
    _dataBaseService = DataBaseService(uid: todo.uid);
    if (this.pending == todo.status) {
      return Card(
        child: ListTile(
          title: Text(
            todo.todoTitle,
          ),
          leading: CircleAvatar(
            child: Icon(Icons.update),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => SimpleDialogBox(
                      user: User(uid: todo.uid),
                      toDo: todo,
                      title: "Edit Todo",
                    ),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  _dataBaseService.delete(todo.docId);
                },
              ),
            ],
          ),
          onTap: () => showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => _dialogBuilder(context, todo),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _dialogBuilder(BuildContext context, ToDo todo) {
    this.isStatus = todo.status;
    return Builder(
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                contentPadding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                title: Center(
                  child: Text(
                    "INFO",
                    style: TextStyle(),
                    textAlign: TextAlign.center,
                  ),
                ),
                children: <Widget>[
                  getListTile(todo.todoTitle, Icons.title),
                  SizedBox(
                    height: 10.0,
                  ),
                  getListTile(todo.description, Icons.description),
                  SizedBox(
                    height: 10.0,
                  ),
                  ListTile(
                    leading: Icon(Icons.assistant_photo),
                    title: Text("Pending"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Switch(
                          value: isStatus,
                          onChanged: (value) {
                            isStatus = value;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                  getListTile(DateFormat.yMd().add_jm().format(todo.dateTime),
                      Icons.timelapse),
                  SizedBox(
                    height: 10.0,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: RaisedButton(
                      child: Text("Close"),
                      color: Theme
                          .of(context)
                          .accentColor,
                      onPressed: () {
                        Navigator.pop(context);
                        _dataBaseService
                            .updateTodo(todo.copyWith(status: this.isStatus));
                      },
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  ListTile getListTile(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
      ),
    );
  }
}
