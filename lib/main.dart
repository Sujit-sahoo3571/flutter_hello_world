import 'package:flutter/material.dart';
import 'package:hello_world/screens/home_page.dart';

void main() => runApp(MaterialApp(
      title: "Simple Intrest Calculator",
      debugShowCheckedModeBanner: false,
      home: SI_Form(),
      theme: ThemeData(brightness: Brightness.dark),
    ));
