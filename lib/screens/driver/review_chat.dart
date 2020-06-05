import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:cartvorie/screens/driver/search_page.dart';
import 'package:cartvorie/screens/driver/profile.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewChat extends StatefulWidget {
  @override
  _ReviewChatState createState() => _ReviewChatState();
}

class _ReviewChatState extends State<ReviewChat> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(children: <Widget>[
                  customAppBar(),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Text('REPLY REVIEW',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18)),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: RatingBar(
                      initialRating: 3,
                      itemSize: 18,
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
                  ),
                  SizedBox(height: 10),

                  //profileBar(),
                  Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            chatBubble(
                                'He was fast and delivered my goods timely. I was pleased with his service',
                                false,
                                '12:16pm'),
                            SizedBox(width: 10),
                            ClipOval(
                              child: Image.asset(
                                'assets/images/sophia.jpg',
                                height: 40,
                              ),
                            ),
                          ])),
                  SizedBox(height: 20),

                  Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            ClipOval(
                              child: Image.asset(
                                'assets/images/sophia.jpg',
                                height: 40,
                              ),
                            ),
                            SizedBox(width: 10),
                            chatBubble(
                                'Thank you for reaching out, we appreciate your opinion.',
                                true,
                                '12:14pm'),
                          ])),
                ]),
                chatControls()
              ],
            ))));
  }

  Widget chatBubble(String message, bool isSender, String time) {
    return Container(
        width: 200,
        // margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: isSender
              ? UniversalVariables.gradientColorEnd
              : UniversalVariables.gradientColorStart,
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
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(message,
                  style: TextStyle(
                    color: Colors.white,
                  )),
              Text(time,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600)),
            ]));
  }

  Widget chatControls() {
    return Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Center(
            child: Row(children: <Widget>[
          Expanded(
              child: TextField(
                  decoration:
                      InputDecoration.collapsed(hintText: 'Your message'))),
          Container(
              width: 60,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[Icon(Icons.attach_file), sendIcon()]))
        ])));
  }

  Widget sendIcon() {
    return Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          // border:Border.all(color:Colors.grey,width:1),
          borderRadius: BorderRadius.circular(25),
          gradient: UniversalVariables.fabGradient,
        ),
        child: Center(child: Icon(Ionicons.ios_send, color: Colors.white)));
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
          leading: ClipOval(
            child: Image.asset(
              'assets/images/sophia.jpg',
              height: 60,
            ),
          ),
          title: Text('Ose:',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              )),
          subtitle: Text('Driver',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: UniversalVariables.gradientColorEnd)),
          trailing: Text('Online',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: UniversalVariables.gradientColorEnd)),
        ));
  }

  Widget dropDownBtn() {
    return Container(
        height: 30,
        width: 100,
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: UniversalVariables.fabGradient),
        child: Center(
            child: Text('New Message',
                style: TextStyle(color: Colors.white, fontSize: 12))));
  }
}
