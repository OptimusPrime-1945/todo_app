import 'package:flutter/material.dart';
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
          barrierDismissible: false,
          context: context,
          builder: (context) => _dialogBuilder(context, todo),
        ),
      ),
    );
  }

  Widget _dialogBuilder(BuildContext context, ToDo todo) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Builder(
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
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
                content: Wrap(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.title),
                      title: Text(todo.todoTitle),
                      // subtitle: Text(todo.description??"description"),
                    ),
                    SwitchListTile(
                      title: ListTile(
                          leading: Icon(Icons.title), title: Text("pending")),
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
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: RaisedButton(
                        child: Text("Close"),
                        color: Theme.of(context).accentColor,
                        // icon: Icon(Icons.cancel),
                        //  iconSize: 30,
                        onPressed: () => Navigator.pop(context),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
