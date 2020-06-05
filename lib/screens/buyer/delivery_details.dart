import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:cartvorie/screens/buyer/pickup_summary.dart';
import 'package:country_code_picker/country_code_picker.dart';

class DeliveryDetails extends StatefulWidget {
  @override
  _DeliveryDetailsState createState() => _DeliveryDetailsState();
}

class _DeliveryDetailsState extends State<DeliveryDetails> {
  bool rememberMe = false;

  void _onRememberMeChanged(bool newValue) => setState(() {
        rememberMe = newValue;

        if (rememberMe) {
          // TODO: Here goes your functionality that remembers the user.
        } else {
          // TODO: Forget the user
        }
      });

  void _onCountryChange(CountryCode countryCode) {
    setState(() {
      userCountryCode = countryCode.toString();
    });
  }

  String userCountryCode;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.grey[100],
            body: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                header(),
                SizedBox(height: 20),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      semiRoundBox('Delivery Address'),
                    ]),
                SizedBox(height: 20),
                contentBoxOne(),
                SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      semiRoundBox('Delivery Instruction'),
                    ]),
                SizedBox(height: 15),
                contentBoxTwo(),
                SizedBox(height: 20),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => PickupSummary()));
                    },
                    child: largeBtn('Continue'))
              ],
            ))));
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

  Widget header() {
    return Stack(
      children: <Widget>[
        Container(
            width: MediaQuery.of(context).size.width,
            height: 120,
            decoration: BoxDecoration(gradient: UniversalVariables.fabGradient),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.directions_bus, color: Colors.white),
                SizedBox(width: 10),
                Text('Delivery',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18))
              ],
            ))),
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

  Widget semiRoundBox(String text) {
    return Container(
        height: 40,
        width: 150,
        decoration: BoxDecoration(
            gradient: UniversalVariables.fabGradient,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), bottomLeft: Radius.circular(25))),
        child: Center(
            child: Text(text,
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w500))));
  }

  Widget contentBoxOne() {
    return Container(
        height: 250,
        child: Stack(
          children: <Widget>[
            Container(
                height: 230,
                padding: EdgeInsets.symmetric(horizontal: 2, vertical: 15),
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 20),
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                      SizedBox(height: 20),
                      Container(
                          // width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Center(
                              child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              customTextInput('Address', 120, 35),
                              customTextInput('City', 70, 35),
                              customTextInput('Province', 70, 35),
                            ],
                          ))),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.90,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Center(
                              child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              customTextInput('Postal Code', 70, 35),
                              numberInput('Country', 190, 45),
                            ],
                          ))),
                    ]))),
            Positioned(left: 0, top: 0, child: locPin())
          ],
        ));
  }

  Widget locPin() {
    return Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: Colors.grey,
            border: Border.all(width: 2, color: Colors.white),
            borderRadius: BorderRadius.circular(25)),
        child: Center(child: Icon(Icons.location_on, color: Colors.white)));
  }

  Widget customTextInput(String title, double width, double height) {
    return Container(
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
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
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1, color: Colors.grey[300])),
                child: TextField(
                    decoration: InputDecoration.collapsed(hintText: '')))
          ],
        ));
  }

  Widget numberInput(String title, double width, double height) {
    return Container(
        height: 65,
        margin: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
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
                padding: EdgeInsets.symmetric(horizontal: 2),
                width: width,
                height: height,
                decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1, color: Colors.grey[300])),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CountryCodePicker(
                      onChanged: _onCountryChange,
                      // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                      initialSelection: 'US',
                      favorite: ['+1', 'US'],
                      // optional. Shows only country name and flag
                      showCountryOnly: false,
                      // optional. Shows only country name and flag when popup is closed.
                      showOnlyCountryWhenClosed: false,
                      // optional. aligns the flag and the Text left
                      alignLeft: false,
                    ),
                    Expanded(
                        child: TextField(
                            decoration:
                                InputDecoration.collapsed(hintText: '')))
                  ],
                ))
          ],
        ));
  }

  Widget contentBoxTwo() {
    return Container(
        height: 200,
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 15),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 20),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              bigInput(),
              Row(children: <Widget>[
                Checkbox(
                    value: rememberMe,
                    onChanged: _onRememberMeChanged,
                    activeColor: UniversalVariables.gradientColorStart),
                Text('Save as primary address')
              ])
            ])));
  }

  Widget bigInput() {
    return Container(
        height: 110,
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Optional (Provide Delivery Instruction)',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16)),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1, color: Colors.grey[300])),
                child: TextField(
                    decoration: InputDecoration.collapsed(
                        hintText: 'Enter text here...'))),
          ],
        ));
  }
}
