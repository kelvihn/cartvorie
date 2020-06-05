import 'package:cartvorie/screens/market_item_page.dart';
import 'package:cartvorie/screens/market_item_single.dart';
import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:cartvorie/screens/review_order.dart';
import 'package:simple_tooltip/simple_tooltip.dart';

class MainStore extends StatefulWidget {
  @override
  _MainStoreState createState() => _MainStoreState();
}

class _MainStoreState extends State<MainStore> {
  final _toolTipKey = new GlobalKey();
  bool isShown = true;
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
                  image: AssetImage('assets/images/shop_bg7.jpg'),
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
            Text('OBA MARKET',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
                Widget>[
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('1122 Jane Street',
                        style: TextStyle(fontSize: 12, color: Colors.white)),
                    SizedBox(height: 8),
                    Text('4262225713',
                        style: TextStyle(fontSize: 12, color: Colors.white))
                  ]),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => ReviewOrder()));
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                Text('Cart',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10)),
                                Icon(Icons.shopping_cart,
                                    size: 10, color: Colors.white)
                              ]))),
                    ),
                    SizedBox(height: 8),
                    Text('9AM - 9PM',
                        style: TextStyle(fontSize: 12, color: Colors.white)),
                    SizedBox(height: 3),
                    SimpleTooltip(
                      key: _toolTipKey,
                      borderColor: UniversalVariables.gradientColorEnd,
                      borderWidth: 1,
                      hideOnTooltipTap: true,
                      minWidth: 200,
                      tooltipTap: () {
                        final dynamic tooltip = _toolTipKey.currentState;
                        tooltip.ensureTooltipVisible();
                      },
                      animationDuration: Duration(seconds: 1),
                      show: isShown,
                      tooltipDirection: TooltipDirection.left,
                      backgroundColor: Colors.black87,
                      child: Icon(Icons.info, size: 16, color: Colors.white),
                      content: Text(
                        "Orders made 30 minutes before store closing may not be delivered same day",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    )
                  ])
            ]),
            SizedBox(height: 15),
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
        padding: EdgeInsets.only(left: 10, top: 10, right: 10),
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
              food == "Soup Ingredients"
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                          Text(food,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                          SimpleTooltip(
                            borderColor: UniversalVariables.gradientColorEnd,
                            borderWidth: 1,
                            hideOnTooltipTap: true,
                            minWidth: 200,
                            backgroundColor: Colors.black87,
                            tooltipTap: () {
                              setState(() {
                                isShown = isShown ? false : true;
                              });
                            },
                            animationDuration: Duration(seconds: 1),
                            show: isShown,
                            tooltipDirection: TooltipDirection.left,
                            child:
                                Icon(Icons.info, size: 16, color: Colors.black),
                            content: Text(
                              "You can order from multiple stores, just add product to cart, go back and choose another store",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          )
                        ])
                  : Text(food,
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
