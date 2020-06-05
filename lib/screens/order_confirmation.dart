import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:cartvorie/screens/home_page.dart';

class OrderConfirmation extends StatefulWidget {
  @override
  _OrderConfirmationState createState() => _OrderConfirmationState();
}

class _OrderConfirmationState extends State<OrderConfirmation> {
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
                image: AssetImage('assets/images/slider6.jpg'),
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
              Container(
                child: Center(
                  child:
                      Image.asset('assets/images/shoppingbag.png', height: 150),
                ),
              ),
              SizedBox(height: 40),
              Container(
                  width: 250,
                  child: Center(
                      child: Text(
                          'Thank you for shopping with us. Order number: 22345',
                          style:
                              TextStyle(color: Colors.white, fontSize: 18)))),
              SizedBox(height: 40),
              Container(
                  width: 250,
                  child: Center(
                      child: Text('Expect Your Order Soon!',
                          style:
                              TextStyle(color: Colors.white, fontSize: 18)))),
              SizedBox(height: 40),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: largeBtn('OK')),
              SizedBox(height: 8),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => HomePage()));
                  },
                  child: Text('Return to home',
                      style: TextStyle(color: Colors.white))),
            ],
          ))),
    ])));
  }

  Widget header() {
    return Stack(
      children: <Widget>[
        Container(
            width: MediaQuery.of(context).size.width,
            height: 120,
            decoration: BoxDecoration(gradient: UniversalVariables.fabGradient),
            child: Center(
                child: Text('Order Confirmation',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18)))),
        Positioned(
          left: 10,
          top: 35,
          child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop()),
        )
      ],
    );
  }

  Widget largeBtn(String text) {
    return Container(
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.blue[900],
            border: Border.all(color: Colors.white, width: 1),
            borderRadius: BorderRadius.circular(5)),
        child: Center(
            child: Text(text,
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold))));
  }
}
