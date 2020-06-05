import 'package:cartvorie/screens/driver/contact_admin_message.dart';
import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:cartvorie/screens/driver/search_page.dart';
import 'package:cartvorie/screens/driver/profile.dart';

class Faq extends StatefulWidget {
  @override
  _FaqState createState() => _FaqState();
}

class _FaqState extends State<Faq> {
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
                  child: Text('FREQUENTLY ASKED QUESTIONS',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
                ),
                SizedBox(height: 10),
                dataBox(),
                SizedBox(height: 30),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => MessageAdmin()));
                    },
                    child: largeBtn('Ask A Question'))
              ],
            ))));
  }

  Widget dataBox() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              question('How fast is your delivery?'),
              SizedBox(height: 8),
              answer(
                  'Most deliveries take less that 30 minutes. Some cases might be different due to hectic traffic.'),
              SizedBox(height: 25),
              question('Are you reliable?'),
              SizedBox(height: 8),
              answer(
                  'Yes we are. Many clients are satisfied with our services and often leave a pleasant review.'),
              SizedBox(height: 25),
              question('Are the delivery items safe?'),
              SizedBox(height: 8),
              answer('Yes they are. Your items are 100% safe with us.')
            ]));
  }

  Widget question(String message) {
    return Text(message,
        style: TextStyle(
            color: UniversalVariables.gradientColorEnd,
            fontSize: 16,
            fontWeight: FontWeight.bold));
  }

  Widget answer(String answer) {
    return Text(answer,
        style: TextStyle(
            // color:UniversalVariables.gradientColorEnd,
            fontSize: 14,
            fontWeight: FontWeight.w400));
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
}
