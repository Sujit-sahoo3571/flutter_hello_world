import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: "StateFul Widget",
      home: Favourite_cityName(),
    ));

class Favourite_cityName extends StatefulWidget {
  const Favourite_cityName({Key? key}) : super(key: key);

  @override
  _Favourite_cityNameState createState() => _Favourite_cityNameState();
}

class _Favourite_cityNameState extends State<Favourite_cityName> {
  String cityName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("StateFul Widget"),
        ),
        body: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                  style: TextStyle(
                    fontSize: 28.0,
                  ),
                  onChanged: (String name) => setState(() {
                        cityName = name;
                      })),
              Text(
                "Your City Name $cityName ",
                style: TextStyle(fontSize: 30.0),
              )
            ],
          ),
        ));
  }
}
