import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/auth_provider.dart';
import 'package:todo_app/services/data_base_service.dart';
import 'package:todo_app/widgets/todo_list.dart';

class DeletedTodoPage extends StatefulWidget {
  @override
  _DeletedTodoPageState createState() => _DeletedTodoPageState();
}

class _DeletedTodoPageState extends State<DeletedTodoPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Deleted Todos"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: StreamProvider.value(
              value: DataBaseService(
                      uid: Provider.of<AuthProvider>(context, listen: false)
                          .user
                          .uid)
                  .deletedTodos,
              child: TodoList(isDeletedPage: true)),
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              heroTag: 'restore',
              child: Icon(Icons.restore),
              tooltip: "Restore all todos",
              onPressed: () async {
                int count = await DataBaseService(
                        uid: Provider.of<AuthProvider>(context, listen: false)
                            .user
                            .uid)
                    .restoreDeletedTodos();
                _scaffoldKey.currentState.removeCurrentSnackBar();
                _scaffoldKey.currentState.showSnackBar(
                  SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          count != 0
                              ? "Restored $count Todo(s)"
                              : "No Todo(s) To Restore",
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              heroTag: 'delete',
              tooltip: "Delete forever",
              child: Icon(Icons.delete_forever),
              onPressed: () async {
                final totalRecords = await DataBaseService(
                        uid: Provider.of<AuthProvider>(context, listen: false)
                            .user
                            .uid)
                    .deleteTodosPermanently();
                _scaffoldKey.currentState.removeCurrentSnackBar();
                _scaffoldKey.currentState.showSnackBar(
                  SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          totalRecords != 0
                              ? "Restored $totalRecords Todo(s)"
                              : "No Todo(s) To Delete",
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
