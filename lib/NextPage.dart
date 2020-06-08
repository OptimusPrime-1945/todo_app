import 'package:flutter/material.dart';

class NextPage extends StatefulWidget{
  String app_bar_title;

  NextPage(this.app_bar_title);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NextPageState(this.app_bar_title);
  }

}
class _NextPageState extends State<NextPage> {
  // ignore: non_constant_identifier_names
  String input_string;
  String app_bar_title;

  // ignore: non_constant_identifier_names
  TextEditingController description_controller = new TextEditingController();
  var priorities = ["High", "Low"];
  var selected;

  _NextPageState(this.app_bar_title);
  // ignore: non_constant_identifier_names
  TextEditingController title_controller = new TextEditingController();

  @override
  void initState() {
    this.selected = this.priorities[1];
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.app_bar_title,
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            // First element
            ListTile(
              title: DropdownButton(
                  items: priorities.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  }).toList(),
                  style: textStyle,
                  value: 'Low',
                  onChanged: (valueSelectedByUser) {
                    setState(() {
                      debugPrint('User selected $valueSelectedByUser');
                    });
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: this.title_controller,
                decoration: new InputDecoration(
                    labelText: "Title",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
                onChanged: (String str) {
                  setState(() {
                    input_string = str;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: this.description_controller,
                decoration: new InputDecoration(
                    labelText: "Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
                onChanged: (String str) {
                  setState(() {
                    input_string = str;
                  });
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
