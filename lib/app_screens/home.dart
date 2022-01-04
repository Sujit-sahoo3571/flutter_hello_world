import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        color: Colors.blue,
        child: Text("FLIGHT",
            style: GoogleFonts.robotoMono(
              textStyle: TextStyle(
                fontSize: 55.0,
                color: Colors.white,
                decoration: TextDecoration.none,
                // fontFamily: 'The_Nautigal',
                // fontWeight: FontWeight.w300
              ),
            )));
  }
}
