import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:cartvorie/screens/driver/trip_details.dart';
import 'package:cartvorie/screens/driver/search_page.dart';
import 'package:cartvorie/screens/driver/profile.dart';

class TripHistory extends StatefulWidget {
  @override
  _TripHistoryState createState() => _TripHistoryState();
}

class _TripHistoryState extends State<TripHistory> {
  List<String> _locations = [
    'Recieved',
    'Refunded',
    'Cancelled',
    'Delivered',
    'Rejected',
  ]; // Option 2
  String _selectedLocation;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            bottomNavigationBar: pageRow(),
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                customAppBar(),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Text('TRIP HISTORY',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
                ),
                SizedBox(height: 20),
                contentBox(),
                contentBox(),
                contentBox(),
                contentBox(),
                contentBox()
              ],
            ))));
  }

  Widget pageRow() {
    return Container(
        width: 250,
        height: 70,
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
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
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
                  children: <Widget>[
                    Text('\$18,000',
                        style: TextStyle(
                            color: UniversalVariables.gradientColorEnd,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Row(
                      children: <Widget>[
                        Text('Status:',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500)),
                        SizedBox(width: 2),
                        Text('Delivered',
                            style: TextStyle(
                                color: UniversalVariables.gradientColorEnd,
                                fontSize: 12,
                                fontWeight: FontWeight.w600))
                      ],
                    )
                  ]),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text('Date:',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500)),
                        SizedBox(width: 2),
                        Text('04/23/20',
                            style: TextStyle(
                                color: UniversalVariables.gradientColorEnd,
                                fontSize: 12,
                                fontWeight: FontWeight.w600))
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => TripDetails()));
                            },
                            child: smallBtn('Details')),
                        SizedBox(width: 5),
                        smallDropdownBtn()
                      ],
                    )
                  ])
            ])));
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

  Widget smallDropdownBtn() {
    return Container(
        height: 25,
        width: 80,
        padding: EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: UniversalVariables.fabGradient),
        child: Center(
            child: DropdownButton(
          itemHeight: 50,
          underline: SizedBox.shrink(),
          isExpanded: true,
          iconDisabledColor: Colors.white,
          iconEnabledColor: Colors.white,
          iconSize: 14,
          style: TextStyle(color: Colors.white, fontSize: 10),
          hint: Text('Status',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 10)), // Not necessary for Option 1
          value: _selectedLocation,
          onChanged: (newValue) {
            setState(() {
              _selectedLocation = newValue;
            });
          },
          items: _locations.map((location) {
            return DropdownMenuItem(
              child: new Text(location,
                  style: TextStyle(color: Colors.grey[400], fontSize: 10)),
              value: location,
            );
          }).toList(),
        )));
  }
}
