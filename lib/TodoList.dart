import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapps/Database/ToDo.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
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

  Widget _listItemBuilder(
    BuildContext context,
    ToDo todo,
  ) {
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: SimpleDialog(
          contentPadding: EdgeInsets.zero,
          elevation: 10.0,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(todo.todoTitle),
                SizedBox(height: 10),
                Text("Pending ${todo.status}")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
