import 'package:cartvorie/screens/buyer/profile.dart';
import 'package:cartvorie/screens/buyer/review_order.dart';
import 'package:cartvorie/screens/buyer/search_page.dart';
import 'package:cartvorie/screens/buyer/start_shopping.dart';
import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:cartvorie/screens/buyer/new_message.dart';
import 'package:cartvorie/screens/buyer/create_message.dart';

class BuyerMessage extends StatefulWidget {
  @override
  _BuyerMessageState createState() => _BuyerMessageState();
}

class _BuyerMessageState extends State<BuyerMessage> {
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
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('MESSAGES',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 18)),
                          dropDownBtn()
                        ])),
                SizedBox(height: 20),
                messageBox('assets/images/sophia.jpg', 'Ose', '4', 'Online'),
                messageBox('assets/images/sophia.jpg', 'Samuel', '4', 'Online'),
                messageBox('assets/images/sophia.jpg', 'James', '4', 'Offline'),
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

  Widget dropDownBtn() {
    return GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => CreateMessage()));
        },
        child: Container(
            height: 30,
            width: 100,
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: UniversalVariables.fabGradient),
            child: Center(
                child: Text('New Message',
                    style: TextStyle(color: Colors.white, fontSize: 12)))));
  }

  Widget messageBox(String image, String name, String number, String status) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => NewMessage()));
        },
        child: Container(
            height: 100,
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.indigo[50],
              borderRadius: BorderRadius.circular(5),
            ),
            child: ListTile(
              leading: ClipOval(
                child: Image.asset(
                  image,
                  height: 60,
                ),
              ),
              subtitle: Text('Driver',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: UniversalVariables.gradientColorEnd)),
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('Status:',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w600)),
                          SizedBox(width: 3),
                          Text(status,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: UniversalVariables.gradientColorEnd))
                        ])
                  ]),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text('12:14pm',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: UniversalVariables.gradientColorEnd)),
                  number == '' ? SizedBox.shrink() : numberBox(number)
                ],
              ),
            )));
  }

  Widget numberBox(String number) {
    return Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: UniversalVariables.fabGradient),
        child: Center(
            child: Text(number,
                style: TextStyle(color: Colors.white, fontSize: 12))));
  }
}
