import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "List View",
      home: Scaffold(
          appBar: AppBar(title: Text("Long List View")),
          body: getListView(),
          floatingActionButton: FloatingActionButton(
              onPressed: () => debugPrint("Add button pressed !"),
              tooltip: "one more Item added",
              child: Icon(Icons.add))),
    );
  }
}

// list generate
List<String> generate_list() {
  var items = List<String>.generate(100, (index) => "Item $index");
  return items;
}

// list Builder
Widget getListView() {
  var listItems = generate_list();
  var listView = ListView.builder(
      itemBuilder: (context, index) => ListTile(
            leading: Icon(Icons.favorite),
            title: Text(listItems[index]),
            onTap: () => showSnackBar(context, listItems[index]),
          ));
  return listView;
}

// snack bar

void showSnackBar(BuildContext context, String item) {
  var snackbar = SnackBar(
    content: Text("You Tapped $item"),
    // duration: Duration(seconds: 30),
    action: SnackBarAction(
      label: "Undo",
      onPressed: () => debugPrint("Undo action started "),
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
