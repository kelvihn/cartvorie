import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:cartvorie/screens/driver/request_details.dart';
import 'package:cartvorie/screens/driver/search_page.dart';
import 'package:cartvorie/screens/driver/profile.dart';

class DeliveryRequest extends StatefulWidget {
  @override
  _DeliveryRequestState createState() => _DeliveryRequestState();
}

class _DeliveryRequestState extends State<DeliveryRequest> {
  List<String> _locations = [
    'Call',
    'Message',
    'Accept',
    'Reject',
  ]; // Option 2
  String _selectedLocation;
  List<String> _locations2 = [
    'New',
    'Old',
  ]; // Option 2
  String _selectedLocation2;
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
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('DELIVERY REQUEST',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 18)),
                          mediumDropdownBtn()
                        ])),
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
                      Image.asset('assets/images/groc1.jpg', height: 8),
                      Image.asset('assets/images/groc2.jpg', height: 8),
                      Image.asset('assets/images/groc3.jpg', height: 8)
                    ],
                  )),
              Container(
                width: MediaQuery.of(context).size.width * 0.60,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text('Buyer:',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(width: 2),
                                Text('Ose',
                                    style: TextStyle(
                                        color:
                                            UniversalVariables.gradientColorEnd,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600))
                              ],
                            ),
                            Text('04/12/2020',
                                style: TextStyle(
                                    color: UniversalVariables.gradientColorEnd,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600))
                          ]),
                      Row(
                        children: <Widget>[
                          Text('Store:',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500)),
                          SizedBox(width: 3),
                          Text('Oba market, African Market',
                              style: TextStyle(
                                  color: UniversalVariables.gradientColorEnd,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600))
                        ],
                      ),
                      Text('\$13,700',
                          style: TextStyle(
                              color: UniversalVariables.gradientColorEnd,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          smallBtn('Details'),
                          SizedBox(width: 8),
                          smallDropdownBtn()
                        ],
                      )
                    ]),
              )
            ])));
  }

  Widget smallBtn(String text) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => RequestDetails()));
        },
        child: Container(
            height: 25,
            width: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: UniversalVariables.fabGradient),
            child: Center(
                child: Text(text,
                    style: TextStyle(fontSize: 10, color: Colors.white)))));
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
          hint: Text('Action',
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

  Widget mediumDropdownBtn() {
    return Container(
        height: 35,
        width: 120,
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: UniversalVariables.fabGradient),
        child: Center(
            child: DropdownButton(
          itemHeight: 50,
          underline: SizedBox.shrink(),
          isExpanded: true,
          iconDisabledColor: Colors.white,
          iconEnabledColor: Colors.white,
          iconSize: 14,
          style: TextStyle(color: Colors.white, fontSize: 12),
          hint: Text('Month',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12)), // Not necessary for Option 1
          value: _selectedLocation2,
          onChanged: (newValue) {
            setState(() {
              _selectedLocation2 = newValue;
            });
          },
          items: _locations2.map((location) {
            return DropdownMenuItem(
              child: new Text(location,
                  style: TextStyle(color: Colors.grey[400], fontSize: 12)),
              value: location,
            );
          }).toList(),
        )));
  }
}
