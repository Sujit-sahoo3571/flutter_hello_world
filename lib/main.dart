import 'package:flutter/material.dart';
import 'package:hello_world/screens/note_detail.dart';
import 'package:hello_world/screens/note_list.dart';

void main() => runApp(MaterialApp(
      title: "Note Keeping v0.1",
      debugShowCheckedModeBanner: false,
      home: NoteList(),
      theme: ThemeData(primarySwatch: Colors.indigo),
    ));
