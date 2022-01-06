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
  List<String> _currencies = ['Rupees', 'Dollar', 'Pound', 'Yen'];
  String? _currentItem = "Rupees";
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
              DropdownButton<String>(
                items: _currencies
                    .map((String ccurrency) => DropdownMenuItem(
                        child: Text(ccurrency), value: ccurrency))
                    .toList(),
                onChanged: (String? newValueSelected) {
                  setState(() {
                    _currentItem = newValueSelected;
                  });
                },
                value: _currentItem,
              ),
              Text(
                "Your City Name $cityName ",
                style: TextStyle(fontSize: 30.0),
              )
            ],
          ),
        ));
  }

  // newvalue function for select currency
  // void dropdownItemSelected(String newValue) {
  //   setState(() {
  //     this._currentItem = newValue;
  //   });
  // }
}
