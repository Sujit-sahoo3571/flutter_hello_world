import 'package:flutter/material.dart';

class SI_Form extends StatefulWidget {
  const SI_Form({Key? key}) : super(key: key);

  @override
  _SI_FormState createState() => _SI_FormState();
}

class _SI_FormState extends State<SI_Form> {
  var _formKey = GlobalKey<FormState>();
  final _minimumPadding = 5.0;
  String? _currentItemSelected = "Rupees";
  var _currency = ['Rupees', 'Dollar', 'Pound', 'Yen'];

  TextEditingController principal = TextEditingController();
  TextEditingController rateOfIntrest = TextEditingController();
  TextEditingController term = TextEditingController();

// result
  var result = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String? _currentItemSelected = _currency[0];
  }

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.headline5;
    return Scaffold(
        appBar: AppBar(
          title: Text("Simple Intrest Calcultor App "),
          backgroundColor: Colors.indigo,
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(_minimumPadding * 2),
            child: ListView(
              children: [
                getImageAsset(),
                customTextField("Principal", "Enter Principal e.g. 12000",
                    textStyle, principal),
                customTextField(
                    "Rate of Intrest", "In Percent", textStyle, rateOfIntrest),
                Row(
                  children: [
                    Expanded(
                        child: customTextField(
                            "Term", "In Years", textStyle, term)),
                    Container(width: _minimumPadding * 5),
                    getDropdown(textStyle),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: _minimumPadding, bottom: _minimumPadding),
                    child: Row(
                      children: [
                        getElevatedButton("Calculate", textStyle, true),
                        Container(
                          width: 30.0,
                        ),
                        getElevatedButton("Reset", textStyle, false),
                      ],
                    )),
                Center(
                    child: Padding(
                  padding: EdgeInsets.all(_minimumPadding),
                  child: Text(
                    this.result,
                    style: textStyle,
                  ),
                ))
              ],
            ),
          ),
        ));
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
  Widget customTextField(String label, String hint, TextStyle? textStyle,
      TextEditingController textcontrol) {
    return Padding(
        padding: EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding),
        child: TextFormField(
          controller: textcontrol,
          keyboardType: TextInputType.number,
          validator: (String? value) {
            if (value!.isEmpty) {
              return "Please enter $label ";
            }
          },
          decoration: InputDecoration(
              labelText: label,
              labelStyle: textStyle,
              hintText: hint,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
              errorStyle:
                  TextStyle(fontSize: 16.0, color: Colors.yellowAccent)),
          style: textStyle,
        ));
  }

  //dropdown widget
  Widget getDropdown(TextStyle? textStyle) {
    return Expanded(
        child: DropdownButton<String>(
      items: _currency.map((String value) {
        return DropdownMenuItem<String>(
          child: Text(
            value,
            style: textStyle,
          ),
          value: value,
        );
      }).toList(),
      value: _currentItemSelected,
      onChanged: (String? newValue) {
        _changeCurrencySymbol(newValue);
      },
    ));
  }

  // Elevated Button

  Widget getElevatedButton(String text, TextStyle? textStyle, bool isCal) {
    return Expanded(
        child: ElevatedButton(
      child: Text(
        text,
        style: textStyle,
        textScaleFactor: 1.1,
      ),
      onPressed: () => setState(() {
        {
          if (isCal) {
            if (_formKey.currentState!.validate()) _showCalculate();
          } else
            _resetAll();
        }
      }),
      style: ElevatedButton.styleFrom(
          primary: Colors.indigo,
          onPrimary: Colors.white,
          elevation: 15.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
    ));
  }

  void _changeCurrencySymbol(String? newValue) {
    setState(() {
      _currentItemSelected = newValue;
    });
  }

  // showCalculated data
  void _showCalculate() {
    double p = double.parse(principal.text);
    double t = double.parse(term.text);
    double r = double.parse(rateOfIntrest.text);

    double sum = p + (p * t * r / 100);

    this.result =
        "After $t Year Your Investment will get $sum $_currentItemSelected ";
    // return result;
  }

  // reset all
  void _resetAll() {
    principal.text = "";
    term.text = "";
    rateOfIntrest.text = "";
    result = "";
    _currentItemSelected = _currency[0];
  }
}
