import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/ToDo.dart';
import 'package:todo_app/models/User.dart';
import 'package:todo_app/services/data_base_service.dart';
import 'package:todo_app/widgets/simple_dialog_box.dart';

class TodoList extends StatefulWidget {
  final bool pending;
  final bool isDeletedPage;

  TodoList({this.pending, this.isDeletedPage = false});

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  DataBaseService _dataBaseService;
  bool isStatus;

  @override
  Widget build(BuildContext context) {
    final todos = getTodosList(Provider.of<List<ToDo>>(context));
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
          SizedBox(
            width: 10,
          ),
          Text("Loading Please wait"),
        ],
      );
  }

  Widget _listItemBuilder(BuildContext context, ToDo todo) {
    _dataBaseService = DataBaseService(uid: todo.uid);
    return Card(
      child: !widget.isDeletedPage
          ? ListTile(
              title: Text(
                todo.todoTitle,
              ),
              leading: CircleAvatar(
                child: todo.status
                    ? Icon(Icons.check)
                    : Icon(Icons.event_available),
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
                          todo: todo,
                          title: "Edit Todo",
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      var deletedTodo = todo.copyWith();
                      _dataBaseService.delete(todo);
                      Scaffold.of(context).removeCurrentSnackBar();
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Deleted",
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          action: SnackBarAction(
                            label: "Undo",
                            onPressed: () =>
                                _dataBaseService.addTodo(deletedTodo),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              onTap: () => showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => _dialogBuilder(context, todo),
              ),
            )
          : ListTile(
              title: Text(
                todo.todoTitle,
              ),
              leading: CircleAvatar(
                child: todo.status
                    ? Icon(Icons.check)
                    : Icon(Icons.event_available),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.restore),
                    onPressed: () {
                      _dataBaseService.restoreDeletedTodo(todo);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () =>
                        _dataBaseService.deleteTodoPermanently(todo),
                  ),
                ],
              )),
    );
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
                  getListTile(
                      DateFormat.yMd().add_jm().format(todo.createdDateTime),
                      Icons.timelapse),
                  getListTile(
                      DateFormat.yMd().add_jm().format(todo.endingDateTime),
                      Icons.timelapse),
                  SizedBox(
                    height: 10.0,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: RaisedButton(
                      child: Text("Close"),
                      color: Theme.of(context).accentColor,
                      onPressed: () {
                        Navigator.pop(context);
                        _dataBaseService
                            .addTodo(todo.copyWith(status: this.isStatus));
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

  List<ToDo> getTodosList(List<ToDo> todoList) {
    if (!widget.isDeletedPage) {
      List<ToDo> temp = new List<ToDo>();
      if (todoList != null) {
        todoList.forEach((element) {
          if (element.status == widget.pending) temp.add(element);
        });
        return temp;
      } else
        return null;
    } else {
      return todoList;
    }
  }
}
