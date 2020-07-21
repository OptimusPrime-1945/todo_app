import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:todoapps/Database/DataBaseService.dart';
import 'package:todoapps/Models/ToDo.dart';
import 'package:todoapps/Models/User.dart';
import 'package:todoapps/Widgets/HomePageDrawer.dart';
import 'package:todoapps/Widgets/Loading.dart';
import 'package:todoapps/Widgets/SimpleDialogBox.dart';
import 'package:todoapps/Widgets/TodoList.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var user;

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    this.user = User(uid: user.uid, name: user.name, email: user.email);
    return loading
        ? Loading()
        : StreamProvider<List<ToDo>>.value(
            value: DataBaseService(uid: this.user.uid).todos,
            child: WillPopScope(
              onWillPop: () async => false,
              child: DefaultTabController(
                length: 2,
                child: Scaffold(
                  appBar: AppBar(
                    title: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Todo List"),
                    ),
                    centerTitle: true,
                    bottom: TabBar(
                      tabs: <Widget>[
                        Tab(
                          text: "Not Completed",
                        ),
                        Tab(
                          text: "Completed",
                        )
                      ],
                    ),
                  ),
                  drawer: HomePageDrawer(),
                  body: TabBarView(
                    children: <Widget>[
                      TodoList(status: false),
                      TodoList(status: true),
                    ],
                  ),
                  // bottomNavigationBar: BubbledNavigationBarWidget(),
                  floatingActionButton: new FloatingActionButton(
                    onPressed: () => showDialog(
                        context: context,
                        builder: (context) => SimpleDialogBox(user: this.user)),
                    child: new Icon(Icons.add),
                    tooltip: "Add New List",
                  ),
                ),
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
