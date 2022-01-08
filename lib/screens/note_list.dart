import 'package:flutter/material.dart';
import 'package:hello_world/screens/note_detail.dart';

class NoteList extends StatefulWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  @override
  Widget build(BuildContext context) {
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
          navigateToDetail("Add Note");
        },
        child: Icon(Icons.add),
        tooltip: "Add Notes",
      ),
      body: getListView(),
    );
  }

// ListView of Tile

  ListView getListView() {
    int count = 1;

    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.blue,
            elevation: 15.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: ListTile(
                leading: Icon(
                  Icons.keyboard_arrow_right_outlined,
                  color: Colors.yellow,
                  size: 35.0,
                ),
                trailing: Icon(Icons.delete),
                title: Text("Meet with Smita"),
                subtitle: Text("8:45 pm , Near Park"),
                onTap: () => navigateToDetail("Edit Note")),
          );
        });
  }

  // navigate to detail
  void navigateToDetail(String title) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetails(title);
    }));
  }
}
