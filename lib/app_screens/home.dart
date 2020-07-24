import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:todoapps/Database/DataBaseService.dart';
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
        : WillPopScope(
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
                        text: "Pending",
                      ),
                      Tab(
                        text: "Not Pending",
                      )
                    ],
                  ),
                ),
                drawer: HomePageDrawer(),
                body: TabBarView(
                  children: <Widget>[
                    StreamProvider.value(
                        value: DataBaseService(uid: this.user.uid).todos,
                        child: TodoList(pending: false)),
                    StreamProvider.value(
                        value: DataBaseService(uid: this.user.uid).todos,
                        child: TodoList(pending: true)),
                  ],
                ),
                // bottomNavigationBar: BubbledNavigationBarWidget(),
                floatingActionButton: new FloatingActionButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context) => SimpleDialogBox(
                      user: this.user,
                      title: "Add Todo",
                    ),
                  ),
                  child: new Icon(Icons.add),
                  tooltip: "Add New List",
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
