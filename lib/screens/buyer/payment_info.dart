import 'package:cartvorie/screens/payment_details_grocery.dart';
import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:cartvorie/screens/buyer/add_card.dart';
import 'package:cartvorie/screens/buyer/checkout_two.dart';

class PaymentInfo extends StatefulWidget {
  @override
  _PaymentInfoState createState() => _PaymentInfoState();
}

class _PaymentInfoState extends State<PaymentInfo> {
  bool rememberMe = false;

  void _onRememberMeChanged(bool newValue) => setState(() {
        rememberMe = newValue;

        if (rememberMe) {
          // TODO: Here goes your functionality that remembers the user.
        } else {
          // TODO: Forget the user
        }
      });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        header(),
        SizedBox(height: 30),
        Text('   Current Method',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            )),
        SizedBox(height: 5),
        checkBox(),
        cardContainer('assets/images/visa.png'),
        otherCardContainer('assets/images/mastercard.png'),
        SizedBox(height: 30),
        GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => AddCard()));
            },
            child: largeBtn('ADD PAYMENT METHOD')),
        GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => PaymentDetailsGrocery()));
            },
            child: largeBtn('Continue')),
      ],
    ))));
  }

  Widget checkBox() {
    return Container(
      height: 120,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
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
          color: Colors.white),
      child: Center(
          child: ListTile(
        title: Text('Cash Payment',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            )),
        subtitle: Text('Pay with cash and save on your order',
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 16, color: Colors.grey)),
        trailing: Checkbox(
            value: rememberMe,
            onChanged: _onRememberMeChanged,
            activeColor: UniversalVariables.gradientColorStart),
      )),
    );
  }

  Widget header() {
    return Stack(
      children: <Widget>[
        Container(
            width: MediaQuery.of(context).size.width,
            height: 120,
            decoration: BoxDecoration(gradient: UniversalVariables.fabGradient),
            child: Center(
                child: Text('Payment Information',
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

  Widget cardContainer(String image) {
    return Container(
        height: 100,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.red),
            borderRadius: BorderRadius.circular(5)),
        child: Center(
            child: ListTile(
          leading: Image.asset(image, height: 50),
          subtitle: Text('Expires 09/20',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Colors.grey)),
          title: Text('1111  2222  3333  4444',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black)),
        )));
  }

  Widget otherCardContainer(String image) {
    return Container(
        height: 100,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(5)),
        child: Center(
            child: ListTile(
          leading: Image.asset(image, height: 50),
          subtitle: Text('Expires 09/20',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Colors.grey)),
          title: Text('1111  2222  3333  4444',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black)),
        )));
  }

  Widget largeBtn(String text) {
    return Container(
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
