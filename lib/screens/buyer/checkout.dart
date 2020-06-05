import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:cartvorie/screens/buyer/pickup_success.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  TextEditingController cardInfo =
      TextEditingController(text: "0000 0000 0000 0000");
  TextEditingController expiresController =
      TextEditingController(text: "MM/YY");
  TextEditingController cvvController = TextEditingController(text: "123");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              backgroundColor: Colors.white,
              elevation: 0.0,
              centerTitle: true,
              title: Text('Checkout',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black))),
          body: SingleChildScrollView(
              child: Column(children: <Widget>[
            SizedBox(height: 40),
            Container(
                child: Center(
                    child: Column(children: <Widget>[
              Icon(Icons.credit_card,
                  size: 95, color: UniversalVariables.gradientColorStart),
              SizedBox(height: 10),
              Text('\$41.32',
                  style: TextStyle(
                      color: UniversalVariables.gradientColorStart,
                      fontSize: 22,
                      fontWeight: FontWeight.bold))
            ]))),
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              child: Text('Update Card Information',
                  style: TextStyle(fontWeight: FontWeight.w600)),
            ),
            SizedBox(height: 10),
            bigInput(),
            smallInputRow(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              child: Text('Card Name',
                  style: TextStyle(fontWeight: FontWeight.w600)),
            ),
            SizedBox(height: 5),
            normalInput(),
            SizedBox(height: 30),
            GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => PickupSuccess()));
                },
                child: largeBtn('Pay'))
          ]))),
    );
  }

  Widget bigInput() {
    return Container(
        height: 80,
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.grey[50],
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(5)),
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Card Number',
                style:
                    TextStyle(fontWeight: FontWeight.w500, color: Colors.grey)),
            TextField(
                controller: cardInfo,
                decoration: InputDecoration.collapsed(hintText: ''))
          ],
        )));
  }

  Widget smallInputRow() {
    return Container(
        height: 120,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Center(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                height: 80,
                width: MediaQuery.of(context).size.width * 0.40,
                decoration: BoxDecoration(
                    color: Colors.grey[50],
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Expires', style: TextStyle(fontSize: 12)),
                      TextField(
                          controller: expiresController,
                          decoration: InputDecoration.collapsed(hintText: ''))
                    ]),
              ),
              Container(
                height: 80,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: MediaQuery.of(context).size.width * 0.40,
                decoration: BoxDecoration(
                    color: Colors.grey[50],
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('CVV', style: TextStyle(fontSize: 12)),
                      TextField(
                          controller: cvvController,
                          decoration: InputDecoration.collapsed(hintText: ''))
                    ]),
              )
            ])));
  }

  Widget normalInput() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 45,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.grey[50],
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(5)),
        child: Center(
            child: TextField(
                decoration: InputDecoration.collapsed(hintText: ''))));
  }

  Widget largeBtn(String text) {
    return Container(
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: UniversalVariables.fabGradient,
            borderRadius: BorderRadius.circular(25)),
        child: Center(
            child: Text(text,
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold))));
  }
}
