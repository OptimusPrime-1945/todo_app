import 'package:flutter/material.dart';

Widget getSimpleDialogBuilder(
    {@required String titile, @required List<Widget> widgets}) {
  return SimpleDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    title: Text(titile),
    contentPadding: EdgeInsets.all(10.0),
    children: widgets,
  );
}
