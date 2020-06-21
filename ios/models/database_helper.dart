import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static DataBaseHelper _dataBaseHelper;
  static Database _database;

  String table = "table";
  String id = "id";
  String title = "title";
  String description = "description";
  String priority = "priority";
  String date = "date";

  DataBaseHelper._createInstance();

  factory DataBaseHelper() {
    if (_dataBaseHelper == null)
      _dataBaseHelper = DataBaseHelper._createInstance();
    return _dataBaseHelper;
  }

  Future<Database> get database async{
    if(_database==null)
      _database=await initializeDatabase();


    return _database;
  }


  Future<Database> initializeDatabase() async{
    Directory directory=await getApplicationDocumentsDirectory();
    String path =directory.path +"notes.db";
    return openDatabase(path,version: 1,onCreate: _createDb);
  }


  void _createDb(Database db,int newVersion) async{
    await db.execute('CREATE TABLE $table($id INTEGER PRIMARY KEY AUTOINCREMENT,$title TEXT,'
        '$description TEXT,$priority INTEGER ,$date TEXT)');
  }


}
