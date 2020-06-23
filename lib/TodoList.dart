import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:todoapps/Database/DataBaseService.dart';
import 'package:todoapps/Database/ToDo.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  DataBaseService _dataBaseService = DataBaseService();
  bool isStatus = false;

  @override
  Widget build(BuildContext context) {
    final todos = Provider.of<List<ToDo>>(context);
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        if (todos.length == 0)
          return Text("Ya No TODOS Left");
        else
          return _listItemBuilder(context, todos[index]);
      },
    );
  }

  Widget _listItemBuilder(BuildContext context, ToDo todo) {
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
              icon: Icon(Icons.delete),
              onPressed: () {
                print("Deleted");
              },
            ),
          ],
        ),
        onTap: () => showDialog(
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
            return SimpleDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              title: Center(
                  child: Text(
                "INFO",
                style: TextStyle(),
                textAlign: TextAlign.center,
              )),
              // sh,ape: Rect
              contentPadding: EdgeInsets.zero,
              //elevation: 10.0,
              children: <Widget>[
                getListTile(todo.todoTitle),
                getListTile(todo.description),
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
                          _dataBaseService.createTodos(
                            uid: todo.uid,
                            title: todo.todoTitle,
                            description: todo.description,
                            status: isStatus,
                          );
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
                    onPressed: () => Navigator.pop(context),
                  ),
                )
              ],
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
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.edit,
            ),
            onPressed: () {
              debugPrint("edit");
            },
          ),
        ],
      ),
    );
  }
}
