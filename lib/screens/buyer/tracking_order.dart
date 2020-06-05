import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:cartvorie/screens/buyer/create_message.dart';
import 'package:cartvorie/screens/buyer/home_page.dart';

class TrackingOrder extends StatefulWidget {
  @override
  _TrackingOrderState createState() => _TrackingOrderState();
}

class _TrackingOrderState extends State<TrackingOrder> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(children: <Widget>[
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/map_routing.png'),
          fit: BoxFit.cover,
        )),
      ),
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.blue[900].withOpacity(.2),
        ),
      ),
      Positioned(bottom: 15, left: 0, right: 0, child: contentBox())
    ])));
  }

  Widget contentBox() {
    return Container(
        height: 300,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5.0, // soften the shadow
              spreadRadius: 0.5, //extend the shadow
              offset: Offset(
                0.0, // Move to right 10  horizontally
                0.0, // Move to bottom 10 Vertically
              ),
            )
          ],
        ),
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              Icon(Foundation.shopping_cart,
                  size: 50, color: UniversalVariables.gradientColorEnd),
              Text('Tracking Order',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('10km Away',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => CreateMessage()));
                              },
                              child: iconBtn(AntDesign.message1)),
                          SizedBox(height: 10),
                          Text('Message',
                              style: TextStyle(
                                fontSize: 14,
                              ))
                        ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          iconBtn(Icons.call),
                          SizedBox(height: 10),
                          Text('Call Driver',
                              style: TextStyle(
                                fontSize: 14,
                              ))
                        ])
                  ]),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => BuyerHomePage()));
                  },
                  child: largeBtn2('Back To Home'))
            ])));
  }

  Widget largeBtn2(String text) {
    return Container(
        height: 45,
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

  Widget iconBtn(IconData icon) {
    return Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          gradient: UniversalVariables.fabGradient,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(child: Icon(icon, color: Colors.white)));
  }
}
