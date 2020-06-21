import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:todoapps/Authentication/AuthService.dart';
import 'package:todoapps/TextForm.dart';

import 'NextPage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var list;
  var count;
  final _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  Firestore _firestore = Firestore();

  TextEditingController todoTitleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    this.list = new ListView();
  }

  createTodos(String input) {
    DocumentReference documentReference =
        Firestore.instance.collection("todos").document(input);
    Map<String, dynamic> todos = {"todoTitle": input, "status": false};
    documentReference.setData(todos).whenComplete(() => print("Created"));
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
                setState(() {});
              },
            )
          ],
        ),
//        drawer: Drawer(
//          child: DrawerHeader(
//            child: Text("test"),
//          ),
//        ),
        body: StreamBuilder(
          stream: Firestore.instance.collection("todos").snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Text("Yay No Todos Left");
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) =>
                  _listItemBuilder(
                    context,
                    snapshot.data.documents[index],
                  ),
            );
          },
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: () => _floatingButtonCard(),
          backgroundColor: Colors.blue,
          child: new Icon(Icons.add),
          tooltip: "Add New List",
        ),
      ),
    );
  }

  void routeToNextPage(String title) async {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext Content) => new NextPage(title),
    ));
  }

  Widget _listItemBuilder(BuildContext context,
      DocumentSnapshot documentSnapshot) {
    return Card(
      child: ListTile(
        title: Text(
          documentSnapshot['todoTitle'].toString(),
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
        onTap: () =>
            showDialog(
              context: context,
              builder: (context) => _dialogBuilder(context, documentSnapshot),
            ),
      ),
    );
  }

  Widget _dialogBuilder(BuildContext context,
      DocumentSnapshot documentSnapshot) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: SimpleDialog(
          contentPadding: EdgeInsets.zero,
          elevation: 10.0,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(documentSnapshot['todoTitle']),
                SizedBox(height: 10),
                Text("Pending ${documentSnapshot['status']}")
              ],
            ),
          ],
        ),
      ),
    );
  }

  _floatingButtonCard() {
    return showDialog(
      context: context,
      builder: (context) =>
          Form(
            key: _formKey,
            child: SimpleDialog(
              title: Center(child: Text("Add Todo")),
              children: <Widget>[
                textForm("Enter Todo", todoTitleController),
                Align(
                  child: FlatButton(
                    child: Text("Add"),
                    onPressed: () {
                      createTodos(todoTitleController.text);
                      todoTitleController.text = "";
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
          ),
    );
  }
}
