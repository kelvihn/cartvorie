import 'package:cartvorie/screens/home_page.dart';
import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class PickupSuccess extends StatefulWidget {
  @override
  _PickupSuccessState createState() => _PickupSuccessState();
}

class _PickupSuccessState extends State<PickupSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/slider5.jpg'),
                fit: BoxFit.cover)),
      ),
      Container(
          padding: EdgeInsets.symmetric(horizontal: 50),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: UniversalVariables.paymentOverlayGradient),
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              Container(
                child: Center(
                    child: Icon(AntDesign.checkcircleo,
                        size: 165, color: Colors.white)),
              ),
              SizedBox(height: 20),
              Container(
                  width: 250,
                  child: Center(
                      child: Text(
                          'Thank you for patronizong us today. Our pickup and delivery partners will soon be on their way.',
                          style:
                              TextStyle(color: Colors.white, fontSize: 18)))),
              SizedBox(height: 10),
              Container(
                  width: 250,
                  child: Center(
                      child: Text('Assigned Delivery Code: 4242',
                          style:
                              TextStyle(color: Colors.white, fontSize: 18)))),
              SizedBox(height: 20),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => HomePage()));
                  },
                  child: largeBtn('OK')),
              SizedBox(height: 8),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => HomePage()));
                  },
                  child: Text('Return to home',
                      style: TextStyle(color: Colors.white, fontSize: 16))),
            ],
          ))),
    ]));
  }

  Widget checkCircle() {
    return Container(
        child: Icon(AntDesign.checkcircleo, size: 165, color: Colors.white));
  }

  Widget largeBtn(String text) {
    return Container(
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            //gradient: UniversalVariables.fabGradient,
            color: Colors.blue[900],
            border: Border.all(color: Colors.white, width: 1),
            borderRadius: BorderRadius.circular(25)),
        child: Center(
            child: Text(text,
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold))));
  }
}
