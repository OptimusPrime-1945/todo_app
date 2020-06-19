import "package:flutter/material.dart";
import 'package:todoapps/Authentication/AuthService.dart';
import 'package:todoapps/Authentication/Wrapper.dart';

import 'NextPage.dart';
import 'ToDo.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var list;

  var count;
  final _auth = AuthService();

  @override
  void initState() {
    super.initState();
    this.list = new ListView();
    this.count = 10;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("Todo List"),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.power_settings_new),
              onPressed: () {
                _auth.signOutGoogle();
                setState(() {

                });
              },
            )
          ],
        ),
//        drawer: Drawer(
//          child: DrawerHeader(
//            child: Text("test"),
//          ),
//        ),
        body: getListView(),
        floatingActionButton: new FloatingActionButton(
          onPressed: () {
            //routeToNextPage("Add Note");
          },
          backgroundColor: Colors.blue,
          child: new Icon(Icons.add),
          tooltip: "Add New List",
        ),
      ),
    );
  }

  Widget getListView() {
    return ListView.builder(
        itemCount: this.count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.keyboard_arrow_right),
              ),
              title: Text("Nothing"),
              subtitle: Text("Dummy"),
              onTap: () {
                return showDialog(
                    context: context,
                    builder: (context) {
                      return SimpleDialog(
                        title: Text("Nothing"),
                      );
                    });
              },
            ),
          );
        });
  }

  void routeToNextPage(String title) async {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext Content) => new NextPage(title),
    ));
  }
}
