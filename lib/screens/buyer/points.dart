import 'package:cartvorie/screens/buyer/profile.dart';
import 'package:cartvorie/screens/buyer/review_order.dart';
import 'package:cartvorie/screens/buyer/search_page.dart';
import 'package:cartvorie/screens/buyer/start_shopping.dart';
import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Points extends StatefulWidget {
  @override
  _PointsState createState() => _PointsState();
}

class _PointsState extends State<Points> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                customAppBar(),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Text('YOUR POINTS',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
                ),
                profileBar(),
                SizedBox(height: 10),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Center(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                          mediumCard('50', 'Total Purchase'),
                          mediumCard('50', 'Total Points'),
                          mediumCard('30', 'Points Used')
                        ]))),
                SizedBox(height: 10),
                SizedBox(height: 10),
                dataBox()
              ],
            ))));
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
                            Navigator.pop(context);
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
                                    child: Icon(Icons.search, size: 30)),
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

  Widget dataBox() {
    return Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Center(
            child: Column(children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: UniversalVariables.gradientColorEnd.withOpacity(.1),
              ),
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Center(
                  child: Row(
                children: <Widget>[
                  Text('Month',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  SizedBox(width: 10),
                  Text('Pending Points',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  SizedBox(width: 10),
                  Text('Purchase',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14))
                ],
              ))),
          Container(
              padding: EdgeInsets.only(left: 15),
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Apr',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                  Text('20',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                  Text('30',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                  smallBtn('Start Shopping')
                ],
              ))),
          Divider(color: UniversalVariables.gradientColorEnd),
          Container(
              padding: EdgeInsets.only(left: 15),
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('May',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                  Text('30',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                  Text('20',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                  smallBtn('Start Shopping')
                ],
              ))),
          Divider(color: UniversalVariables.gradientColorEnd)
        ])));
  }

  Widget smallBtn(String text) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => GroceryDelivery()));
        },
        child: Container(
            height: 25,
            width: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: UniversalVariables.fabGradient),
            child: Center(
                child: Text(text,
                    style: TextStyle(fontSize: 10, color: Colors.white)))));
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
          title: Text(
              'For every order you earn 100 points, 1000 points equals \$10 discount that can be applied to any of your purchases. So keep shopping for more points.',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  color: Colors.black)),
        ));
  }

  Widget mediumCard(String number, String text) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        height: 100,
        width: 100,
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
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white))
          ],
        ));
  }
}
