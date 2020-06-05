import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:cartvorie/screens/reciever_info.dart';
import 'package:simple_tooltip/simple_tooltip.dart';

class Pickup extends StatefulWidget {
  @override
  _PickupState createState() => _PickupState();
}

class _PickupState extends State<Pickup> {
  bool isShown = true;
  bool rememberMe = false;
  bool rememberMe2 = false;

  void _onRememberMeChanged(bool newValue) => setState(() {
        rememberMe = newValue;

        if (rememberMe) {
          // TODO: Here goes your functionality that remembers the user.
        } else {
          // TODO: Forget the user
        }
      });

  void _onRememberMeChanged2(bool newValue) => setState(() {
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
            appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.black),
                backgroundColor: Colors.white,
                elevation: 1.0,
                centerTitle: true,
                title: Text('Pickup Address',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black))),
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10),
                Container(
                    width: MediaQuery.of(context).size.width,
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
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: customTextInput('Postal Code', 70, 35),
                ),
                SizedBox(height: 10),
                Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Center(
                        child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        customTextInput('What is the item?',
                            MediaQuery.of(context).size.width * 0.45, 40),
                        customTextInput('What is the size?',
                            MediaQuery.of(context).size.width * 0.40, 40),
                      ],
                    ))),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: bigInput(),
                ),
                SizedBox(height: 10),
                checkBox(),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: customTextInput('Amount', 120, 40),
                ),
                SizedBox(height: 10),
                confirm(),
                SizedBox(height: 10),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Add Picture',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 16)),
                        SizedBox(height: 10),
                        chooseFileBox(),
                      ],
                    )),
                SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => RecieverInfo()));
                        },
                        child: largeBtn('Continue'))
                  ],
                )
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

  Widget chooseFileBox() {
    return Container(
        height: 40,
        width: 280,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 1, color: Colors.grey)),
        child: Row(children: <Widget>[
          Container(
              height: 40,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                  child: Text('Choose File',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w300)))),
          SizedBox(width: 20),
          Text('No file chosen',
              style: TextStyle(
                color: Colors.grey,
              ))
        ]));
  }

  Widget customTextInput(String title, double width, double height) {
    return Container(
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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

  Widget confirm() {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                  'Are you sure the amount above is what is required for the item?',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16)),
              Row(children: <Widget>[
                Row(children: <Widget>[
                  Text('Yes'),
                  SizedBox(width: 1),
                  Checkbox(
                      value: rememberMe,
                      onChanged: _onRememberMeChanged,
                      activeColor: UniversalVariables.gradientColorStart),
                ]),
                SizedBox(width: 10),
                Row(children: <Widget>[
                  Text('No'),
                  SizedBox(width: 1),
                  Checkbox(
                      value: rememberMe2,
                      onChanged: _onRememberMeChanged2,
                      activeColor: UniversalVariables.gradientColorStart),
                ]),
                SizedBox(width: 10),
                SimpleTooltip(
                  borderColor: UniversalVariables.gradientColorEnd,
                  borderWidth: 1,
                  hideOnTooltipTap: true,
                  backgroundColor: Colors.black87,
                  minWidth: 200,
                  tooltipTap: () {
                    setState(() {
                      isShown = !isShown;
                    });
                  },
                  animationDuration: Duration(seconds: 1),
                  show: isShown,
                  tooltipDirection: TooltipDirection.right,
                  child: Icon(Icons.info, size: 16, color: Colors.black),
                  content: Text(
                    "Please note that items paid for on your behalf attract a little fee",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      decoration: TextDecoration.none,
                    ),
                  ),
                )
              ])
            ]));
  }

  Widget bigInput() {
    return Container(
        height: 110,
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Please provide a litte detail of the item',
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
                    decoration: InputDecoration.collapsed(hintText: '')))
          ],
        ));
  }

  Widget checkBox() {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Are we paying for this item on your behalf?',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16)),
              Row(children: <Widget>[
                Row(children: <Widget>[
                  Text('Yes'),
                  SizedBox(width: 1),
                  Checkbox(
                      value: rememberMe,
                      onChanged: _onRememberMeChanged,
                      activeColor: UniversalVariables.gradientColorStart),
                ]),
                SizedBox(width: 10),
                Row(children: <Widget>[
                  Text('No'),
                  SizedBox(width: 1),
                  Checkbox(
                      value: rememberMe2,
                      onChanged: _onRememberMeChanged2,
                      activeColor: UniversalVariables.gradientColorStart),
                ]),
              ])
            ]));
  }
}

//remove phone number and stretch country
//in pickup summary changes soup to cloths
//
//change market to an address in canada
//payment detials: Change card icon, change text to the one she sent.
//There are two checkout pages.
//Fix them,
//4242 is your assigned delivery code or Assigned delivery code: 4242
