import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:cartvorie/screens/buyer/tracking_preview.dart';

class TrackDelivery extends StatefulWidget {
  @override
  _TrackDeliveryState createState() => _TrackDeliveryState();
}

class _TrackDeliveryState extends State<TrackDelivery> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.black),
                backgroundColor: Colors.white,
                elevation: 1.0,
                centerTitle: true,
                title: Text('Track Delivery',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black))),
            backgroundColor: Colors.white,
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(
                  child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                    SizedBox(height: 100),
                    Text('TRACK YOUR DELIVERY',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        )),
                    SizedBox(height: 22),
                    inputBox(),
                    SizedBox(height: 30),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => TrackingPreview()));
                        },
                        child: largeBtn2('Start Tracking'))
                  ])),
            )));
  }

  Widget largeBtn2(String text) {
    return Container(
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: UniversalVariables.fabGradient,
            borderRadius: BorderRadius.circular(5)),
        child: Center(
            child: Text(text,
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold))));
  }

  Widget inputBox() {
    return Container(
      height: 50,
      padding: EdgeInsets.fromLTRB(10, 2, 10, 5),
      width: 300,
      decoration: BoxDecoration(
        border:
            Border.all(width: 1, color: UniversalVariables.gradientColorEnd),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
          decoration: InputDecoration.collapsed(
              hintText: 'Enter delivery ID to track delivery')),
    );
  }
}
