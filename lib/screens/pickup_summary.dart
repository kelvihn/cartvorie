import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:cartvorie/screens/payment_details.dart';

class PickupSummary extends StatefulWidget {
  @override
  _PickupSummaryState createState() => _PickupSummaryState();
}

class _PickupSummaryState extends State<PickupSummary> {
  bool rememberMe = false;

  void _onRememberMeChanged(bool newValue) => setState(() {
        rememberMe = newValue;

        if (rememberMe) {
          // TODO: Here goes your functionality that remembers the user.
        } else {
          // TODO: Forget the user
        }
      });
  int val1 = 1;
  int val2 = 1;
  int val3 = 1;
  int val4 = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.grey[200],
            appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.black),
                centerTitle: true,
                backgroundColor: Colors.white,
                title: Text('Pick-up Summary',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black))),
            body: SingleChildScrollView(
                child: Column(children: <Widget>[
              itemBox('assets/images/png_bag.png', 'Bags', '(5 X \$5)', '10',
                  'Ontario Mall, Ontario', val1),
              itemBox('assets/images/sh3.png', 'Shirts', '(5 X \$5)', '5',
                  'St Marie Mall, Quebec', val2),
              itemBox('assets/images/sh6.png', 'Tee - Shirts', '(5 X \$5)',
                  '10', 'Classic Stores, Mannitoba', val3),
              deliveryAddressBox(),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => PaymentDetails()));
                  },
                  child: headerBtn('Proceed to Checkout'))
            ]))));
  }

  Widget itemBox(String image, String soupName, String qty, String price,
      String market, int value) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
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
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
              Image.asset(
                image,
                height: 60,
              ),
              VerticalDivider(),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(soupName, style: TextStyle(color: Colors.black)),
                    Text('$qty',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 12)),
                    Text('\$$price',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12)),
                    Text(market,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 12))
                  ]),
              counterBox(value)
            ])));
  }

  Widget counterBox(int value) {
    return Container(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        IconButton(icon: Icon(Icons.remove), onPressed: () => decrement(value)),
        SizedBox(width: 3),
        Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
                color: Colors.grey[400],
                border: Border.all(width: 1, color: Colors.white)),
            child: Center(
                child: Text(
              '$value',
            ))),
        SizedBox(width: 3),
        IconButton(icon: Icon(Icons.add), onPressed: () => increment(value)),
      ],
    ));
  }

  Widget headerBtn(String text) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        padding: EdgeInsets.all(5),
        height: 40,
        width: 180,
        decoration: BoxDecoration(
            gradient: UniversalVariables.fabGradient,
            borderRadius: BorderRadius.circular(25)),
        child: Center(
            child: Text(text,
                style: TextStyle(color: Colors.white, fontSize: 12))));
  }

  Widget totalBox() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 70,
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Total',
                        style: TextStyle(
                            color: UniversalVariables.gradientColorStart,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    Text('(${val1 + val2 + val3 + val4} items)',
                        style: TextStyle(color: Colors.black))
                  ]),
              Text('\$29',
                  style: TextStyle(
                      color: UniversalVariables.gradientColorStart,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
            ])));
  }

  Widget deliveryAddressBox() {
    return Container(
        height: 170,
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        width: MediaQuery.of(context).size.width,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Delivery Address',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(5))),
              Row(children: <Widget>[
                Text('Save as primary address'),
                SizedBox(width: 1),
                Checkbox(
                    value: rememberMe,
                    onChanged: _onRememberMeChanged,
                    activeColor: UniversalVariables.gradientColorStart),
              ]),
            ]));
  }

  decrement(int value) {
    setState(() {
      value = value != 0 ? value-- : 0;
    });
  }

  increment(int value) {
    setState(() {
      value = value++;
    });
  }
}

Widget verticalDivider() {
  return Container(width: 2, color: Colors.grey);
}
