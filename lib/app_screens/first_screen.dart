import 'dart:math';

import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue,
      child: Center(
          child: Text(generateNum(),
              style: TextStyle(color: Colors.white, fontSize: 40.1))),
    );
  }

  String generateNum() {
    var random = Random();
    int num = random.nextInt(10);

    return "Your Lucky Number :$num";
  }
}
