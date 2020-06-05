import 'package:cartvorie/screens/buyer/profile.dart';
import 'package:cartvorie/screens/buyer/review_order.dart';
import 'package:cartvorie/screens/buyer/search_page.dart';
import 'package:cartvorie/screens/buyer/start_shopping.dart';
import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:cartvorie/screens/buyer/tracking_preview.dart';

class StartTracking extends StatefulWidget {
  @override
  _StartTrackingState createState() => _StartTrackingState();
}

class _StartTrackingState extends State<StartTracking> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
                child: Column(children: <Widget>[
              customAppBar(),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Text('LIVE TRACKING',
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
              ),
              profileBar(),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                        mediumCard('10', 'Total Delivered'),
                        GestureDetector(
                            onTap: () {},
                            child: mediumCard('3', 'Total in Transit'))
                      ]))),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('TRACK YOUR DELIVERY',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18)),
                        SizedBox(height: 10),
                        buildTextInput('Enter delivery ID to track delivery'),
                      ])),
              SizedBox(height: 10),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => TrackingPreview()));
                  },
                  child: largeBtn('Start Tracking'))
            ]))));
  }

  Widget buildTextInput(String hintText) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
      // margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          border:
              Border.all(color: UniversalVariables.gradientColorEnd, width: 1),
          borderRadius: BorderRadius.circular(5)),
      child: Center(
          child: TextField(
        decoration: InputDecoration.collapsed(hintText: hintText),
      )),
    );
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

  Widget customAppBar() {
    return Container(
        color: Colors.white,
        height: 70,
        child: Stack(
          children: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                width: MediaQuery.of(context).size.width,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.black),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                      Container(
                          width: 230,
                          child: Center(
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (_) => SearchPage()));
                                    },
                                    child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      SearchPage()));
                                        },
                                        child: Icon(Icons.search, size: 30))),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (_) => ReviewOrder()));
                                    },
                                    child: Icon(Icons.shopping_cart, size: 30)),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) => Profile()));
                                  },
                                  child: Icon(Icons.person_outline, size: 30),
                                ),
                              ])))
                    ])),
            Positioned(
                top: 15,
                right: 125,
                child: Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: UniversalVariables.gradientColorStart),
                ))
          ],
        ));
  }

  Widget profileBar() {
    return Container(
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
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListTile(
          title: Row(
            children: <Widget>[
              Text('Buyer ID:',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  )),
              SizedBox(width: 10),
              Text('Ose214',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: UniversalVariables.gradientColorEnd))
            ],
          ),
          subtitle: Row(
            children: <Widget>[
              Icon(Icons.location_on),
              SizedBox(width: 3),
              Text('Ose',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: UniversalVariables.gradientColorEnd))
            ],
          ),
          trailing: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => Profile()));
              },
              child: ClipOval(
                child: Image.asset(
                  'assets/images/sophia.jpg',
                  height: 60,
                ),
              )),
        ));
  }

  Widget mediumCard(String number, String text) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        height: 150,
        width: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: UniversalVariables.fabGradient),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(number,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            Text(text,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white))
          ],
        ));
  }
}
