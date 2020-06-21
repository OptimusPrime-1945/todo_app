import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:todoapps/Authentication/AuthService.dart';

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
  String input = "";
  Firestore _firestore = Firestore();

  @override
  void initState() {
    super.initState();
    this.list = new ListView();
  }

  createTodos() {
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
            return Card(
              child: ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) =>
                    _listItemBuilder(
                      context,
                      snapshot.data.documents[index],
                    ),
              ),
            );
          },
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) =>
                  Form(
                    key: _formKey,
                    child: SimpleDialog(
                      title: Center(child: Text("Add Todo")),
                      children: <Widget>[
                        TextFormField(
                          onChanged: (val) {
                            setState(() {
                              input = val;
                            });
                          },
                          validator: (val) => val.isEmpty ? "Enter Todo" : null,
                          decoration: InputDecoration(
                            labelText: "Enter Todo",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                        Align(
                          child: FlatButton(
                            child: Text("Add"),
                            onPressed: () {
                              createTodos();
                              Navigator.pop(context);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
            );
          },
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
    return GestureDetector(
      onTap: () =>
          showDialog(
            context: context,
            builder: (context) => _dialogBuilder(context, documentSnapshot),
          ),
      child: Card(
        child: ListTile(
          title: Text(documentSnapshot['todoTitle'].toString()),
          leading: Icon(Icons.arrow_right),
          trailing: Icon(Icons.delete),
          onTap: () {},
        ),
      ),
    );
  }

  Widget _dialogBuilder(BuildContext context,
      DocumentSnapshot documentSnapshot) {
    return SimpleDialog(
      contentPadding: EdgeInsets.zero,
      children: <Widget>[
        Text(documentSnapshot['todoTitle']),
        SizedBox(height: 10),
        Text("Pending ${documentSnapshot['status']}")
      ],
    );
  }
}
