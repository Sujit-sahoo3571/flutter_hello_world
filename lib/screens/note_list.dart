import 'package:flutter/material.dart';
import 'package:hello_world/screens/note_detail.dart';
import 'package:hello_world/utils/database_helper.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hello_world/models/note.dart';

class NoteList extends StatefulWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note>? noteList;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (noteList == null) {
      noteList = <Note>[];
      updateListView();
    }
    TextStyle? textStyle = Theme.of(context).textTheme.subtitle1;
    TextStyle bigText = TextStyle(
        color: Colors.white, fontSize: 19.5, fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("FAB pressed ");
          navigateToDetail(Note('','',2,''), "Add Note");
        },
        child: Icon(Icons.add),
        tooltip: "Add Notes",
      ),
      body: getListView(),
    );
  }

// ListView of Tile

  ListView getListView() {
  
    TextStyle? textStyle = Theme.of(context).textTheme.subtitle1;

    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            // shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(10.0)),
            child: ListTile(
                leading: CircleAvatar(
                  backgroundColor:
                      getPriorityColor(this.noteList![position].priority),
                  child: getPriorityIcon(this.noteList![position].priority),
                ),
                trailing: GestureDetector(
                  child: Icon(
                    Icons.delete,
                    color: Colors.grey,
                  ),
                  onTap: () => {_delete(context, noteList![position])},
                ),
                title: Text(this.noteList![position].title, style: textStyle,),
                subtitle: Text(this.noteList![position].date),
                onTap: () =>
                    navigateToDetail(noteList![position], "Edit Note")),
          );
        });
  }

  // navigate to detail
  void navigateToDetail(Note note, String title) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetails(note, title);
    }));

    if (result) updateListView();
  }

  // Priority Colors
  Color getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.red;
      case 2:
        return Colors.yellow;
      default:
        return Colors.yellow;
    }
  }

  // priority Icon
  Icon getPriorityIcon(int priority) {
    switch (priority) {
      case 1:
        return Icon(Icons.play_arrow);
      case 2:
        return Icon(Icons.keyboard_arrow_right);
      default:
        return Icon(Icons.keyboard_arrow_right);
    }
  }

  // delete note
  void _delete(BuildContext context, Note note) async {
    int result = await databaseHelper.deleteNote(note.id);
    if (result != 0) _showSnackBar(context, "Note Deleted Successfully ");
    updateListView();
  }

  // showSnackBar
  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // updateListView()
  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
      noteListFuture.then((noteList) {
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });
    });
  }
}
