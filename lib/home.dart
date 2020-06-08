import "package:flutter/material.dart";

import 'NextPage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var list;

  var count;

  @override
  void initState() {
    super.initState();
    this.list = list = new ListView();
    this.count = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("Todo List"),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: getListView(),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          routeToNextPage("Add Note");
        },
        backgroundColor: Colors.blue,
        child: new Icon(Icons.add),
        tooltip: "Add New List",
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
                routeToNextPage("Edit Note");
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
