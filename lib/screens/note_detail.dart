import 'package:flutter/material.dart';
import 'package:hello_world/models/note.dart';
import 'package:hello_world/utils/database_helper.dart';
import 'package:intl/intl.dart';

class NoteDetails extends StatefulWidget {
  // const NoteDetails({Key? key} ) : super(key: key);

  final String title;
  final Note note;
  NoteDetails(this.note, this.title);
  @override
  _NoteDetailsState createState() => _NoteDetailsState(this.note, this.title);
}

class _NoteDetailsState extends State<NoteDetails> {
  static final _priority = ["Low", "High"];
  // String? _selectedItem = "Low";
  DatabaseHelper helper = DatabaseHelper();

  final String title;
  final Note note;
  _NoteDetailsState(this.note, this.title);
  TextEditingController headingController = TextEditingController();
  TextEditingController subheadingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.subtitle1;

    headingController.text = note.title;
    subheadingController.text = note.description;

    return
        // WillPopScope(
        // onWillPop: () {
        //   // null checker can't fix still it will work
        //   //  ? onWillpop
        //   moveToLastScreen();
        // },
        // child:
        Scaffold(
      appBar: AppBar(
          title: Text(this.title),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              moveToLastScreen();
            },
          )),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            //first child
            ListTile(
              title: DropdownButton<String>(
                items: _priority.map((String dropdownItemvalue) {
                  return DropdownMenuItem<String>(
                    child: Text(dropdownItemvalue, style: textStyle ),
                    value: dropdownItemvalue ,
                  );
                }).toList(),

                value: getPriorityAsString(note.priority),

                style:  textStyle,
                onChanged: (newvalue) {
                  setState(() {
                    debugPrint(newvalue);
                    updatePriorityAsInt(newvalue);
                  });
                },
                
              ),
            ),

// second element
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: headingController,
                style: textStyle,
                onChanged: (value) {
                  // debugPrint(value);
                  updateTitle();
                },
                decoration: InputDecoration(
                    label: Text("Note"),
                    labelStyle: textStyle,
                    // hintText: "e.g. Nandini's Birthday: ",
                    // hintStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
            ),

            // Third element
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: subheadingController,
                style: textStyle,
                onChanged: (value) {
                  // debugPrint(value);
                  updateDescription();
                },
                decoration: InputDecoration(
                    label: Text("Descriptions"),
                    labelStyle: textStyle,
                    // hintText: "e.g. 12th Dec ",
                    // hintStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
            ),

            // 4th elements Add and Delete Button
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    child: Text(
                      "SAVE",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {
                      // debugPrint("Save pressed ");
                      setState(() {
                        _save();
                      });
                    },
                  )),
                  Container(
                    width: 20.0,
                  ),
                  Expanded(
                      child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    child: Text(
                      "DELETE",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _delete();
                      });
                      // debugPrint("Delete pressed ");
                    },
                  ))
                ],
              ),
            )
          ],
        ),
      ),
      // )
    );
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  //update priority as Int for saving in database
  void updatePriorityAsInt(String? value) {
    switch (value) {
      case 'High':
        note.priority = 1;
        break;
      case 'Low':
        note.priority = 2;
        break;
    }
  }

  //update priority as String for Note keeper
  String getPriorityAsString(int value) {
    String priority = 'Low';
    switch (value) {
      case 1:
        priority = _priority[1];
        break;
      case 2:
        priority = _priority[0];
        break;
    }
    return priority;
  }

  // update title

  void updateTitle() {
    note.title = headingController.text;
  }

  // update description
  void updateDescription() {
    note.description = subheadingController.text;
  }

  // save to database
  void _save() async {
    moveToLastScreen();

    note.date = DateFormat.yMMMd().format(DateTime.now());
    int result;
    if (note.id != null) {
      // update the note
      result = await helper.updateNote(note);
    } else {
      // insert new note
      result = await helper.insertNote(note);
    }
    if (result != 0)
      _showAlertDialog("Status", "Successfully Saved");
    else
      _showAlertDialog("Status", "Problem to Save ");
  }

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );

    showDialog(context: context, builder: (_) => alertDialog);
  }

  // _delete() note
  void _delete() async {
    moveToLastScreen();
    if (note.id == null) {
      // FAB new note
      _showAlertDialog("Status", "NO Note Deleted ");
      return;
    }

    int result = await helper.deleteNote(note.id);
    if (result != 0)
      _showAlertDialog("Status", "Note Delete Successfully");
    else
      _showAlertDialog("Status", "Some error occured ");
  }
}
