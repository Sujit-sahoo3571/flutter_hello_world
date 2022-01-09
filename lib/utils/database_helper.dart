// ignore_for_file: unnecessary_null_comparison, prefer_conditional_assignment

import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:hello_world/models/note.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static  DatabaseHelper? _databaseHelper; // singleton
  static  Database? _database ;

  DatabaseHelper._createInstance();
  // factory constructor
  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper!;
  }

  // Database Table and col names
  String noteTable = 'noteTable';
  String colId = 'id';
  String colTitle = 'title';
  String colDate = 'date';
  String colDescription = 'description';
  String colPriority = 'priority';

  // create database fun

  void _createdb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $noteTable ($colId INTEGER PRIMARY KEY AUTOINCREMENT,'
        ' $colTitle TEXT,'
        ' $colDate TEXT,  $colPriority INTEGER , $colDescription TEXT',);
  }

  // INITIALIZE DATABASE AND DIRECTORY PATH
  Future<Database> initializeDatabase() async {
    // get directory path for android and ios to store databse
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';

    var notesDatabase =
        await openDatabase(path, version: 1, onCreate: _createdb);

    return notesDatabase;
  }

  // getter of database
  Future<Database> get database async {
    if (_database == null) _database = await initializeDatabase();
    return _database!;
  }

  // fetch operation : get Notes from our Database
  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await database;

    // var result = await db.rawQuery('SELECT  * FROM $noteTable ORDER'
    //     ' BY $colPriority ASC ');
    var result = await db.query(noteTable, orderBy: '$colPriority ASC');
    return result;
  }

  //Insert Operation : Insert a note object to a database
  Future<int> insertNote(Note note) async {
    Database db = await database;
    var result = await db.insert(
      noteTable,
      note.toMap(),
    );
    return result;
  }

  // update Operation : update in database
  Future<int> updateNote(Note note) async {
    var db = await database;
    var result = await db.update(noteTable, note.toMap(),
        where: '$colId = ?', whereArgs: [note.id]);
    return result;
  }

  // delete from database

  Future<int> deleteNote(int? id) async {
    var db = await database;
    var result = db.rawDelete('DELETE FROM $noteTable where $colId = $id ');
    return result;
  }

  Future<int?> getCount() async {
    var db = await database;
    // var
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT(*) FROM $noteTable');
    int? result = Sqflite.firstIntValue(x);
    return result;
  }

  //get the 'Map List' and convert to 'Note List'
  Future<List<Note>> getNoteList() async {
    var noteMapList = await getNoteMapList();
    int count = noteMapList.length;

    List<Note> noteList = <Note>[];

    for (int i = 0; i < count; i++) {
      noteList.add(Note.fromMapObject(noteMapList[i]));
    }
    return noteList; 
  }
}
