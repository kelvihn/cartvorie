import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:cartvorie/screens/buyer/main_store.dart';

class GroceryDelivery extends StatefulWidget {
  @override
  _GroceryDeliveryState createState() => _GroceryDeliveryState();
}

class _GroceryDeliveryState extends State<GroceryDelivery> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.grey[100],
            body: SingleChildScrollView(
                child: Column(children: <Widget>[
              header(),
              SizedBox(height: 10),
              contentBox(),
              SizedBox(height: 20),
              pageRow()
            ]))));
  }

  Widget header() {
    return Stack(children: <Widget>[
      Container(
          height: 170,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/shop_bg2.jpg'),
                  fit: BoxFit.cover))),
      Container(
        height: 170,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: UniversalVariables.gradientColorEnd.withOpacity(.6)),
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Start Shopping',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
            SizedBox(height: 20),
            searchBox()
          ],
        )),
      ),
      Positioned(
          left: 10,
          top: 10,
          child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () => Navigator.of(context).pop()))
    ]);
  }

  Widget searchBox() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        height: 40,
        width: MediaQuery.of(context).size.width * 0.75,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Colors.white),
        child: Center(
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              Text('Search Stores',
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 17,
                      fontWeight: FontWeight.w600)),
              Icon(Icons.search)
            ])));
  }

  Widget contentBox() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.60,
        padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: ListView(children: <Widget>[
            customListTile(
                'assets/images/shop_bg5.jpg', 'Akilugbe African Store'),
            customListTile('assets/images/shop_bg6.jpg', 'Oba Market'),
            customListTile(
                'assets/images/shop_bg7.jpg', 'Akilugbe African Store'),
            customListTile('assets/images/shop_bg8.jpeg', 'Oba Market'),
            customListTile(
                'assets/images/shop_bg2.jpg', 'Akilugbe African Store'),
            customListTile('assets/images/shop_bg4.jpg', 'Oba Market'),
            customListTile(
                'assets/images/shop_bg7.jpg', 'Akilugbe African Store'),
          ]),
        ));
  }

  Widget customListTile(String image, String shop) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        width: MediaQuery.of(context).size.width * 0.95,
        margin: EdgeInsets.symmetric(vertical: 7, horizontal: 5),
        height: 100,
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
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              imageCard(image),
              Container(
                  width: 120,
                  child: Text(shop,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600))),
              btnColumn()
            ])));
  }

  Widget imageCard(String image) {
    return Container(
      height: 80,
      width: 90,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          )),
    );
  }

  Widget btnColumn() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              height: 35,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: UniversalVariables.gradientColorStart),
              child: Center(
                  child: Text('10km Away',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      )))),
          GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => MainStore()));
              },
              child: Container(
                  height: 35,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: UniversalVariables.gradientColorEnd),
                  child: Center(
                      child: Text('Visit Store',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          )))))
        ]);
  }

  Widget pageRow() {
    return Container(
        width: 250,
        child: Center(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(Icons.arrow_back_ios, size: 18),
            Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                    color: UniversalVariables.gradientColorEnd,
                    borderRadius: BorderRadius.circular(25)),
                child: Center(
                    child: Text('1',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.white)))),
            Text('2   3   4   5   6   7',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                )),
            Icon(Icons.arrow_forward_ios, size: 18),
          ],
        )));
  }
}
