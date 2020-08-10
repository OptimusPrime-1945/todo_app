import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Database/DataBaseService.dart';
import 'package:todo_app/models/User.dart';
import 'package:todo_app/widgets/home_page_drawer.dart';
import 'package:todo_app/widgets/simple_dialog_box.dart';
import 'package:todo_app/widgets/todo_list.dart';

class Home extends StatefulWidget {
  final User user;

  const Home({@required this.user});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("Todo List"),
          ),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(
                text: "Pending",
              ),
              Tab(
                text: "Not Pending",
              )
            ],
          ),
        ),
        drawer: HomePageDrawer(
          user: widget.user,
        ),
        body: TabBarView(
          children: <Widget>[
            StreamProvider.value(
                value: DataBaseService(uid: widget.user.uid).todos,
                child: TodoList(pending: false)),
            StreamProvider.value(
                value: DataBaseService(uid: widget.user.uid).todos,
                child: TodoList(pending: true)),
          ],
        ),
        // bottomNavigationBar: BubbledNavigationBarWidget(),
        floatingActionButton: new FloatingActionButton(
          onPressed: () => showDialog(
            context: context,
            builder: (context) => SimpleDialogBox(
              user: widget.user,
              title: "Add Todo",
            ),
          ),
          child: new Icon(Icons.add),
          tooltip: "Add New List",
        ),
      ),
    );
  }
}

//  Future<Widget> _floatingButtonCard() async {
//    return showDialog(
//      context: context,
//      builder: (context) =>
//    );
//  }
//}
