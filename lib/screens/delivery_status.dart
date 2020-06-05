import 'package:cartvorie/screens/driver/profile.dart';
import 'package:cartvorie/screens/driver/search_page.dart';
import 'package:cartvorie/screens/goods_details.dart';
import 'package:cartvorie/screens/grocery_delivery.dart';
import 'package:cartvorie/screens/login_page.dart';
import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class DeliveryStatus extends StatefulWidget {
  @override
  _DeliveryStatusState createState() => _DeliveryStatusState();
}

class _DeliveryStatusState extends State<DeliveryStatus> {
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
                  child: Text('GOODS DELIVERY STATUS',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
                ),
                contentBox(),
                contentBox(),
                contentBox()
              ],
            ))));
  }

  Widget contentBox() {
    return Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.indigo[50],
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
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
                  Widget>[
            Container(
                alignment: Alignment.center,
                height: 80,
                width: 80,
                child: GridView.count(
                  padding: EdgeInsets.zero,
                  crossAxisSpacing: 0.5,
                  mainAxisSpacing: 0.5,
                  crossAxisCount: 2,
                  children: <Widget>[
                    Image.asset('assets/images/png_bag.png', height: 8),
                    Image.asset('assets/images/png_shirt.png', height: 8),
                    Image.asset('assets/images/png_shoe.png', height: 8)
                  ],
                )),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text('Driver:',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500)),
                            SizedBox(width: 2),
                            Text('Ose',
                                style: TextStyle(
                                    color: UniversalVariables.gradientColorEnd,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600))
                          ],
                        ),
                        Text('10km',
                            style: TextStyle(
                                color: UniversalVariables.gradientColorEnd,
                                fontSize: 12,
                                fontWeight: FontWeight.w600))
                      ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(onTap: () {}, child: smallBtn('Call')),
                      GestureDetector(onTap: () {}, child: smallBtn('Message')),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => GoodsDetails()));
                          },
                          child: smallBtn('Details')),
                    ],
                  )
                ])
          ]),
        ));
  }

  Widget smallBtn(String text) {
    return Container(
        height: 25,
        width: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: UniversalVariables.fabGradient),
        child: Center(
            child: Text(text,
                style: TextStyle(fontSize: 10, color: Colors.white))));
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
                                    child: Icon(Icons.search, size: 30)),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  GroceryDelivery()));
                                    },
                                    child: Icon(Icons.shopping_cart, size: 30)),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) => LoginPage()));
                                  },
                                  child: Column(children: [
                                    Icon(Icons.person_outline, size: 30),
                                    SizedBox(height: 3),
                                    Text('Login/Signup',
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500))
                                  ]),
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
}
