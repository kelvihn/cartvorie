import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:cartvorie/screens/buyer/tracking_order.dart';
import 'package:cartvorie/screens/buyer/delivery_status.dart';

class TrackingPreview extends StatefulWidget {
  @override
  _TrackingPreviewState createState() => _TrackingPreviewState();
}

class _TrackingPreviewState extends State<TrackingPreview> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(
      children: <Widget>[
        Positioned(
            top: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.40,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/delivery_bike.png'),
                fit: BoxFit.cover,
              )),
            )),
        Positioned(
            top: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.blue[900].withOpacity(.4),
              ),
            )),
        Positioned(
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.50,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey[50],
            )),
        Positioned(bottom: 80, left: 0, right: 0, child: contentBox())
      ],
    )));
  }

  Widget contentBox() {
    return Container(
      height: 400,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
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
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Driver ID',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )),
                Text('Ose',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: UniversalVariables.gradientColorStart,
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Buyer ID',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )),
                Text('Ose222',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: UniversalVariables.gradientColorStart,
                    ))
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Delivery Address',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )),
                Text('Allen Avenue, Canada',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: UniversalVariables.gradientColorStart,
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Amount',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )),
                Text('\$400',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: UniversalVariables.gradientColorStart,
                    ))
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Current Location',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )),
                Text('Down town, Canada',
                    style: TextStyle(
                      fontSize: 16,
                      color: UniversalVariables.gradientColorStart,
                      fontWeight: FontWeight.w600,
                    ))
              ],
            ),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => DeliveryStatus()));
                },
                child: largeBtn('Delivery Status')),
            GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => TrackingOrder()));
                },
                child: largeBtn('Distance')),
            largeBtn2('Done')
          ]),
    );
  }

  Widget largeBtn(String text) {
    return Container(
        height: 30,
        width: 130,
        decoration: BoxDecoration(
            gradient: UniversalVariables.fabGradient,
            borderRadius: BorderRadius.circular(25)),
        child: Center(
            child: Text(text,
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold))));
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
}
