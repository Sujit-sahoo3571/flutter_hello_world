import 'package:flutter/material.dart';

class NoteDetails extends StatefulWidget {
  // const NoteDetails({Key? key} ) : super(key: key);

  String title;
  NoteDetails(this.title);
  @override
  _NoteDetailsState createState() => _NoteDetailsState(this.title);
}

class _NoteDetailsState extends State<NoteDetails> {
  static var _priority = ["Low", "High"];
  String? _selectedItem = "Low";

  String title;
  _NoteDetailsState(this.title);
  TextEditingController headingController = TextEditingController();
  TextEditingController subheadingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.subtitle1;

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
                items: _priority.map((String value) {
                  return DropdownMenuItem<String>(
                    child: Text(
                      value,
                      textScaleFactor: 1.5,
                      style: textStyle,
                    ),
                    value: value,
                  );
                }).toList(),
                onChanged: (newvalue) {
                  setState(() {
                    debugPrint(newvalue);
                    _selectedItem = newvalue;
                  });
                },
                value: _selectedItem,
              ),
            ),

// second element
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: headingController,
                style: textStyle,
                onChanged: (value) {
                  debugPrint(value);
                },
                decoration: InputDecoration(
                    label: Text("Note"),
                    labelStyle: textStyle,
                    hintText: "e.g. Smita's Birthday: ",
                    hintStyle: textStyle,
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
                  debugPrint(value);
                },
                decoration: InputDecoration(
                    label: Text("Descriptions"),
                    labelStyle: textStyle,
                    hintText: "e.g. 24th Feb ",
                    hintStyle: textStyle,
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
                      debugPrint("Save pressed ");
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
                      debugPrint("Delete pressed ");
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
    Navigator.pop(context);
  }
}
