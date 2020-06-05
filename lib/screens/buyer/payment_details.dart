import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:cartvorie/screens/buyer/checkout.dart';
import 'package:flutter_icons/flutter_icons.dart';

class PaymentDetails extends StatefulWidget {
  @override
  _PaymentDetailsState createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.black),
                centerTitle: true,
                backgroundColor: Colors.white,
                title: Text('Payment Details',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black))),
            body: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                paymentMethods(),
                SizedBox(height: 20),
                detailsBox(),
                SizedBox(height: 20),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => Checkout()));
                    },
                    child: largeBtn('Checkout'))
              ],
            ))));
  }

  Widget paymentMethods() {
    return Container(
        height: 150,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Payment Methods',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
            SizedBox(width: 20),
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  paymentBox('Card', Icons.credit_card),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      paymentBox('Cash', MaterialIcons.attach_money),
                      SizedBox(height: 4),
                      Text('Pay with cash and \nsave on your order',
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 12),
                          textAlign: TextAlign.center),
                    ],
                  )
                ])
          ],
        )));
  }

  Widget paymentBox(String method, IconData icon) {
    return Container(
        height: 35,
        width: 100,
        padding: EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
            color: Colors.grey[100],
            border: Border.all(width: 1, color: Colors.grey[400]),
            borderRadius: BorderRadius.circular(25)),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(icon, color: UniversalVariables.gradientColorEnd),
            Text(method,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12))
          ],
        )));
  }

  Widget detailsBox() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 350,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
              Text('Payment Details',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Items',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    Text('5',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w300))
                  ]),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Total',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    Text('\$29',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w300))
                  ]),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Tax',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600)),
                        SizedBox(height: 4),
                        Text('(13% of the order)',
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 12),
                            textAlign: TextAlign.center),
                      ],
                    ),
                    Text('\$4',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w300))
                  ]),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Delivery fee',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    Text('\$10',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w300))
                  ]),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Service Fee',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    Text('\$2.32',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w300))
                  ]),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Grand Total',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text('\$41.32',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold))
                  ]),
            ])));
  }

  Widget largeBtn(String text) {
    return Container(
        height: 60,
        margin: EdgeInsets.symmetric(vertical: 10),
        width: MediaQuery.of(context).size.width * 0.70,
        decoration: BoxDecoration(
            gradient: UniversalVariables.fabGradient,
            borderRadius: BorderRadius.circular(25)),
        child: Center(
            child: Text(text,
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold))));
  }
}
