import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:todoapps/Database/DataBaseService.dart';
import 'package:todoapps/Models/ToDo.dart';
import 'package:todoapps/Models/User.dart';
import 'package:todoapps/Widgets/SimpleDialogBox.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  DataBaseService _dataBaseService;
  bool isStatus = false;

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
                  builder: (context) => SimpleDialogBox(user: User(uid: todo.uid),toDo :todo,),
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
  }

  Widget _dialogBuilder(BuildContext context, ToDo todo) {
    return Builder(
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
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
                contentPadding: EdgeInsets.zero,
                //elevation: 10.0,
                children: <Widget>[
                  getListTile(todo.todoTitle),
                  SizedBox(
                    height: 10.0,
                  ),
                  getListTile(todo.description),
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
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: RaisedButton(
                      child: Text("Close"),
                      color: Theme.of(context).accentColor,
                      onPressed: () {
                        Navigator.pop(context);
                        _dataBaseService.updateTodo(
                          ToDo(
                            docId: todo.docId,
                            uid: todo.uid,
                            todoTitle: todo.todoTitle,
                            description: todo.description,
                            status: isStatus,
                          ),
                        );
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

  ListTile getListTile(String title) {
    return ListTile(
      leading: Icon(Icons.title),
      title: Text(title),
      trailing: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
      ),
    );
  }
}
