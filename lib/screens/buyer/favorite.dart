import 'package:cartvorie/screens/buyer/profile.dart';
import 'package:cartvorie/screens/buyer/review_order.dart';
import 'package:cartvorie/screens/buyer/search_page.dart';
import 'package:cartvorie/screens/buyer/start_shopping.dart';
import 'package:cartvorie/screens/market_item_single.dart';
import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Column(children: <Widget>[
      customAppBar(),
      Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Text('FAVORITES',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
      ),
      SizedBox(height: 20),
      Container(
          width: MediaQuery.of(context).size.width,
          child: Center(
              child: GridView.count(
            physics: ScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            crossAxisCount: 2,
            children: <Widget>[
              indomieItemBox('assets/images/groc1.jpg', 'Indomie Noodles'),
              indomieItemBox('assets/images/groc2.jpg', 'Wheat Flour'),
              indomieItemBox('assets/images/groc3.jpg', 'Semovita'),
              indomieItemBox('assets/images/groc4.jpg', 'Spaghetti'),
              indomieItemBox('assets/images/groc5.jpg', 'Corn Flakes'),
              indomieItemBox('assets/images/groc6.jpg', 'Golden Morn'),
              indomieItemBox('assets/images/groc1.jpg', 'Indomie Noodles'),
              indomieItemBox('assets/images/groc2.jpg', 'Wheat Flour'),
              indomieItemBox('assets/images/groc3.jpg', 'Semovita'),
            ],
          ))),
    ]))));
  }

  Widget indomieItemBox(String image, String name) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => MarketItemSingle(image: image, name: name)));
        },
        child: Container(
            child: Stack(children: <Widget>[
          Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
              margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(5)),
              width: 150,
              height: 220,
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                    Image.asset(image, height: 80),
                    Container(
                        // width: 180,
                        child: Center(
                            child: Text(name,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600)))),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('\$13',
                              style: TextStyle(
                                  color: UniversalVariables.gradientColorEnd,
                                  fontWeight: FontWeight.w600)),
                          Row(children: <Widget>[
                            RatingBar(
                              initialRating: 5,
                              itemSize: 12,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              //itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: UniversalVariables.gradientColorEnd,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            SizedBox(width: 5),
                            Text('18',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600)),
                          ])
                        ])
                  ]))),
          Positioned(top: 10, left: 1, child: pickerCon())
        ])));
  }

  Widget pickerCon() {
    return Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            gradient: UniversalVariables.fabGradient,
            borderRadius: BorderRadius.circular(25)),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(Icons.arrow_back, size: 14, color: Colors.white),
            Icon(Icons.arrow_forward, size: 14, color: Colors.white),
          ],
        )));
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
}
