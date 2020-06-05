import 'package:cartvorie/screens/market_item_page.dart';
import 'package:cartvorie/screens/market_item_single.dart';
import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:cartvorie/screens/review_order.dart';

class OthersCategory extends StatefulWidget {
  @override
  _OthersCategoryState createState() => _OthersCategoryState();
}

class _OthersCategoryState extends State<OthersCategory> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.grey[100],
            body: SingleChildScrollView(
                child: Column(children: <Widget>[
              header(),
              SizedBox(height: 10),
              soupBox('Soup Ingredients'),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                viewAllBtn(),
              ]),
              soupBox('Swallow'),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                viewAllBtn(),
              ]),
              soupBox('Fresh Produce'),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                viewAllBtn(),
              ]),
              SizedBox(height: 20),
              headerBtn('Continuation Page')
            ]))));
  }

  Widget headerBtn(String text) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        padding: EdgeInsets.all(5),
        height: 50,
        width: 200,
        decoration: BoxDecoration(
            gradient: UniversalVariables.fabGradient,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(text,
                style: TextStyle(color: Colors.white, fontSize: 12))));
  }

  Widget header() {
    return Stack(children: <Widget>[
      Container(
          height: 190,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/others.jpg'),
                  fit: BoxFit.cover))),
      Container(
        height: 190,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: UniversalVariables.gradientColorEnd.withOpacity(.6)),
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Other Categories',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
            SizedBox(height: 15),
            searchBox()
          ],
        )),
      ),
      Positioned(
        right: 10,
        top: 25,
        child: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => ReviewOrder()));
            },
            child: Container(
                padding: EdgeInsets.all(5),
                height: 25,
                width: 60,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(25)),
                child: Center(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                      Text('Cart',
                          style: TextStyle(color: Colors.white, fontSize: 10)),
                      Icon(Icons.shopping_cart, size: 10, color: Colors.white)
                    ])))),
      ),
      Positioned(
          left: 10,
          top: 10,
          child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () => Navigator.of(context).pop()))
    ]);
  }

//09020912128
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
              Text('Search Products',
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 17,
                      fontWeight: FontWeight.w600)),
              Icon(Icons.search)
            ])));
  }

  Widget soupBox(String food) {
    return Container(
        height: 150,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.only(left: 10, top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
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
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(food,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Container(
                  height: 90,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.all(10),
                      children: <Widget>[
                        imgContainer('assets/images/soup1.jpg', 'Ogbono'),
                        imgContainer('assets/images/soup2.jpg', 'Egusi'),
                        imgContainer('assets/images/soup3.jpg', 'Groundnut'),
                        imgContainer('assets/images/soup4.jpg', 'Banga'),
                      ]))
            ]));
  }

  Widget imgContainer(String image, String name) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => MarketItemSingle(image: image, name: name)));
        },
        child: Container(
            height: 140,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      height: 50,
                      width: 80,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: Colors.black),
                          image: DecorationImage(
                              image: AssetImage(image), fit: BoxFit.cover))),
                  // SizedBox(height: 8),
                  Text(name, style: TextStyle(fontSize: 14))
                ])));
  }

  Widget viewAllBtn() {
    return GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => MarketItemPage()));
        },
        child: Container(
            height: 30,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            width: 100,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.red[900],
                borderRadius: BorderRadius.circular(25)),
            child: Center(
                child: Text('View more',
                    style: TextStyle(
                      color: Colors.white,
                    )))));
  }
}
