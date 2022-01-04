import 'package:flutter/material.dart';
import 'package:hello_world/app_screens/first_screen.dart';

void main() => runApp(FlutterApp());


class FlutterApp extends StatelessWidget {
  const FlutterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "MY Flutter App",
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: Text("My First App")),
          body: const FirstScreen()
        ));
  }
}
