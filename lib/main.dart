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
      ),
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
            onTap: () => debugPrint("${listItems[index]} was clicked "),
          ));
  return listView;
}
