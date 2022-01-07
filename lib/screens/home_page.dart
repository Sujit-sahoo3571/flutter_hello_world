import 'package:flutter/material.dart';

class SI_Form extends StatefulWidget {
  const SI_Form({Key? key}) : super(key: key);

  @override
  _SI_FormState createState() => _SI_FormState();
}

class _SI_FormState extends State<SI_Form> {
  final _minimumPadding = 5.0;
  var _currency = ['Rupees', 'Dollar', 'Pound', 'Yen'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Intrest Calcultor App "),
      ),
      body: Container(
        padding: EdgeInsets.all(_minimumPadding * 2),
        child: ListView(
          children: [
            getImageAsset(),
            customTextField("Principal", "Enter Principal e.g. 12000"),
            customTextField("Rate of Intrest", "In Percent"),
            Row(
              children: [
                Expanded(child: customTextField("Term", "In Years")),
                Container(width: _minimumPadding * 5),
                getDropdown(),
              ],
            ),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: [
                    getElevatedButton("Calculate"),
                    Container(
                      width: 30.0,
                    ),
                    getElevatedButton("Reset"),
                  ],
                )
                ),
               Center(child : Padding(padding: EdgeInsets.all(_minimumPadding),
                child: Text("Todo Text "),
                )
                 )
          ],
        ),
      ),
    );
  }

// image asset widget
  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('images/money.png');

    Image image = Image(image: assetImage, width: 125.0, height: 125.0);
    return Container(
      child: image,
      padding: EdgeInsets.all(_minimumPadding * 10),
    );
  }

// TextField widget
  Widget customTextField(String label, String hint) {
    return Padding(
        padding: EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding),
        child: TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        ));
  }

  //dropdown widget
  Widget getDropdown() {
    return Expanded(
        child: DropdownButton<String>(
      items: _currency.map((String value) {
        return DropdownMenuItem<String>(
          child: Text(
            value,
          ),
          value: value,
        );
      }).toList(),
      value: "Rupees",
      onChanged: (String? newValue) {},
    ));
  }

  // Elevated Button

  Widget getElevatedButton(String text) {
    return Expanded(
        child: ElevatedButton(
      child: Text(text),
      onPressed: () => {},
    ));
  }
}
