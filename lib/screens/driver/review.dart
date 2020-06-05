import 'package:cartvorie/screens/driver/review_chat.dart';
import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cartvorie/screens/driver/search_page.dart';
import 'package:cartvorie/screens/driver/profile.dart';

class Reviews extends StatefulWidget {
  @override
  _ReviewsState createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
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
                  child: Text('REVIEWS & FEEDBACK',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
                ),
                SizedBox(height: 10),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => ReviewChat()));
                    },
                    child: itemBox('assets/images/sophia.jpg',
                        'He was fast and delivered my goods timely. I was pleased with his service.')),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => ReviewChat()));
                    },
                    child: itemBox('assets/images/sophia.jpg',
                        'He was fast and delivered my goods timely. I was pleased with his service.')),
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
                          width: 100,
                          child: Center(
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                IconButton(
                                    icon: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      SearchPage()));
                                        },
                                        child: Icon(Icons.search, size: 30)),
                                    onPressed: () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) => SearchPage()))),
                                SizedBox(width: 10),
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
          ],
        ));
  }

  Widget itemBox(String image, String message) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        height: 100,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5.0, // soften the shadow
            spreadRadius: 0.5, //extend the shadow
            offset: Offset(
              0.0, // Move to right 10  horizontally
              0.0, // Move to bottom 10 Vertically
            ),
          )
        ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ClipOval(
                      child: Image.asset(
                        image,
                        height: 50,
                      ),
                    ),
                    RatingBar(
                      initialRating: 3,
                      itemSize: 12,
                      minRating: 0,
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
                  ]),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Ose', style: TextStyle(fontWeight: FontWeight.w600)),
                    Text('Review',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: UniversalVariables.gradientColorEnd,
                        )),
                    Container(
                      width: 170,
                      child: Text(message,
                          style: TextStyle(fontWeight: FontWeight.w600)),
                    )
                  ]),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text('Buyer',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: UniversalVariables.gradientColorEnd,
                        )),
                    SizedBox(height: 5),
                    Text('4/25/2020',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: UniversalVariables.gradientColorEnd,
                        )),
                  ])
            ])));
  }
}
