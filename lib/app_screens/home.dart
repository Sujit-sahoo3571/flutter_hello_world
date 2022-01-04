import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        // margin: EdgeInsets.only(left: 10.0, top: 10.0),
        alignment: Alignment.center,
        color: Colors.blue,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Text("ipsum slodre",
                        style: GoogleFonts.robotoMono(
                          textStyle: TextStyle(
                            fontSize: 35.0,
                            color: Colors.white,
                            decoration: TextDecoration.none,
                            // fontFamily: 'The_Nautigal',
                            // fontWeight: FontWeight.w300
                          ),
                        ))),
                Expanded(
                    child: Text("lorem inpunsoo ousij insopu sde ",
                        style: GoogleFonts.robotoMono(
                          textStyle: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            decoration: TextDecoration.none,
                            // fontFamily: 'The_Nautigal',
                            // fontWeight: FontWeight.w300
                          ),
                        ))),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Text("lorem Ipsum themo",
                        style: GoogleFonts.robotoMono(
                          textStyle: TextStyle(
                            fontSize: 35.0,
                            color: Colors.white,
                            decoration: TextDecoration.none,
                            // fontFamily: 'The_Nautigal',
                            // fontWeight: FontWeight.w300
                          ),
                        ))),
                Expanded(
                    child: Text("lorem ipsum  ",
                        style: GoogleFonts.robotoMono(
                          textStyle: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            decoration: TextDecoration.none,
                            // fontFamily: 'The_Nautigal',
                            // fontWeight: FontWeight.w300
                          ),
                        ))),
              ],
            ),
            UserImage(),
            FlightBookingButton()
          ],
        ));
  }
}

class UserImage extends StatelessWidget {
  const UserImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/flight.png');
    Image image = Image(
      image: assetImage,
      width: 250.0,
      height: 250.0,
    );

    return Container(child: image);
  }
}

class FlightBookingButton extends StatelessWidget {
  const FlightBookingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(10.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(10.0),
            primary: Color.fromRGBO(0, 255, 25, 0.6),
            elevation: 6.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Text(
          "Book Your Ticket",
          style: GoogleFonts.robotoMono(
              textStyle: TextStyle(color: Colors.white, fontSize: 26.0)),
        ),
        onPressed: () {
          AlertMsgBooking(context);
        },
      ),
    );
  }

  void AlertMsgBooking(BuildContext context) {
    var alertDialog = AlertDialog(
        title: Text("Booking Successful!"),
        content: Text(
          'Your booking Recorded Successfully ',
        ));

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
