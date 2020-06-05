import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:cartvorie/screens/delivery_details.dart';

class RecieverInfo extends StatefulWidget {
  @override
  _RecieverInfoState createState() => _RecieverInfoState();
}

class _RecieverInfoState extends State<RecieverInfo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.black),
                backgroundColor: Colors.grey[100],
                elevation: 0.0,
                centerTitle: true),
            body: SingleChildScrollView(
                child: Column(children: <Widget>[
              Text('Receiver Information',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18)),
              SizedBox(height: 20),
              customTextInput('Name', MediaQuery.of(context).size.width, 40),
              customTextInput(
                  'Phone No', MediaQuery.of(context).size.width, 40),
              SizedBox(height: 40),
              Text('Sender Information',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18)),
              SizedBox(height: 20),
              customTextInput('Name', MediaQuery.of(context).size.width, 40),
              customTextInput(
                  'Phone No', MediaQuery.of(context).size.width, 40),
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => DeliveryDetails()));
                      },
                      child: largeBtn('Continue'))
                ],
              )
            ]))));
  }

  Widget customTextInput(String title, double width, double height) {
    return Container(
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(title,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16)),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: width,
                height: height,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1, color: Colors.grey[300])),
                child: TextField(
                    decoration: InputDecoration.collapsed(hintText: '')))
          ],
        ));
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
