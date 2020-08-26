import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData themeData;
  bool darkTheme = false;
  final themeDataList = [
    ThemeData.light().copyWith(
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.blue,
        textTheme: ButtonTextTheme.primary,
      ),
    ),
    ThemeData.dark().copyWith(
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.tealAccent,
        textTheme: ButtonTextTheme.primary,
      ),
    ),
  ];

  ThemeChanger() {
    this.themeData = themeDataList[0];
  }

  get currentTheme => themeData;

  changeTheme(bool switchTheme) {
    this.darkTheme = switchTheme;
    if (switchTheme == false)
      this.themeData = themeDataList[0];
    else
      this.themeData = themeDataList[1];
    notifyListeners();
  }
}
