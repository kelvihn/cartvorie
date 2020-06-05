import 'package:cartvorie/screens/driver/map_address.dart';
import 'package:cartvorie/screens/driver/search_page.dart';
import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:cartvorie/screens/driver/profile.dart';

class RequestDetails extends StatefulWidget {
  @override
  _RequestDetailsState createState() => _RequestDetailsState();
}

class _RequestDetailsState extends State<RequestDetails> {
  List<String> _locations = [
    'Navigate to Store',
    'Done Shopping',
    'In Transit',
    'To Delivery Address',
    'Delivered',
    'Rejected',
    'Refunded',
  ]; // Option 2
  String _selectedLocation;
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
                  child: Text('DELIVERY REQUEST DETAILS',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
                ),
                SizedBox(height: 20),
                contentBox(),
                SizedBox(height: 10),
                Text('Navigate to Store',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: UniversalVariables.gradientColorEnd)),
                SizedBox(height: 10),
                mapBox(),
                SizedBox(height: 10),
              ],
            ))));
  }

  Widget mapBox() {
    return Stack(children: <Widget>[
      Container(
        height: 200,
        alignment: Alignment.centerRight,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/map_cut.jpeg'),
                fit: BoxFit.cover)),
      ),
      Positioned(
          top: 20,
          left: 0,
          right: 0,
          child: buildTextInput('Enter Store Address'))
    ]);
  }

  Widget buildTextInput(String hintText) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(.8),
          border:
              Border.all(color: UniversalVariables.gradientColorEnd, width: 1),
          borderRadius: BorderRadius.circular(5)),
      child: Center(
          child: TextField(
        decoration: InputDecoration.collapsed(hintText: hintText),
      )),
    );
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
        height: 400,
        //color: Colors.grey,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Order Number:',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      )),
                  Text('2345',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: UniversalVariables.gradientColorEnd))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Buyer:',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      )),
                  Text('Ose',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: UniversalVariables.gradientColorEnd))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Amount:',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      )),
                  Text('\$40,000',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: UniversalVariables.gradientColorEnd))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Purchase Date:',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      )),
                  Text('04/11/20',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: UniversalVariables.gradientColorEnd))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Store 1:',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      )),
                  Text('Oba Market',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: UniversalVariables.gradientColorEnd)),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => MapAddress()));
                      },
                      child: smallBtn('Navigate to Store'))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Store 2:',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      )),
                  Text('African Market',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: UniversalVariables.gradientColorEnd)),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => MapAddress()));
                      },
                      child: smallBtn('Navigate to Store'))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Goods:',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      )),
                  Column(children: <Widget>[
                    Text('1.1 Bag of Rice',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: UniversalVariables.gradientColorEnd)),
                    SizedBox(height: 10),
                    Text('2.2 Can of Drinks',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: UniversalVariables.gradientColorEnd))
                  ]),
                  Column(children: <Widget>[
                    Row(children: <Widget>[
                      Image.asset('assets/images/rice_bag.jpg', height: 20),
                      SizedBox(width: 5),
                      Text('(Oba Market)',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: UniversalVariables.gradientColorEnd))
                    ]),
                    SizedBox(height: 5),
                    Row(children: <Widget>[
                      Image.asset('assets/images/groc1.jpg', height: 20),
                      SizedBox(width: 5),
                      Text('(African Market)',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: UniversalVariables.gradientColorEnd))
                    ])
                  ])
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Payment type:',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      )),
                  Text('Card',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: UniversalVariables.gradientColorEnd))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Delivery Addres:',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      )),
                  Text('No, 5, Wuse II, \nAbuja:',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: UniversalVariables.gradientColorEnd)),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => MapAddress()));
                      },
                      child: smallBtn('Navigate to address')),
                ],
              ),
              dropDownBtn()
            ]));
  }

  Widget dropDownBtn() {
    return Container(
        height: 35,
        width: 150,
        padding: EdgeInsets.symmetric(horizontal: 5),
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
          style: TextStyle(color: Colors.white, fontSize: 14),
          hint: Text('Update Status',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14)), // Not necessary for Option 1
          value: _selectedLocation,
          onChanged: (newValue) {
            setState(() {
              _selectedLocation = newValue;
            });
          },
          items: _locations.map((location) {
            return DropdownMenuItem(
              child: new Text(location,
                  style: TextStyle(color: Colors.grey[400], fontSize: 14)),
              value: location,
            );
          }).toList(),
        )));
  }

  Widget smallBtn(String text) {
    return Container(
        height: 30,
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: UniversalVariables.fabGradient),
        child: Center(
            child: Text(text,
                style: TextStyle(fontSize: 10, color: Colors.white))));
  }
}
