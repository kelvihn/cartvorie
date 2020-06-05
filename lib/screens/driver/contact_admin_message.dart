import 'package:flutter/material.dart';
import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:cartvorie/screens/driver/search_page.dart';
import 'package:cartvorie/screens/driver/profile.dart';

class MessageAdmin extends StatefulWidget {
  @override
  _MessageAdminState createState() => _MessageAdminState();
}

class _MessageAdminState extends State<MessageAdmin> {
  List<String> _locations = [
    'Customer Service',
    'Technical Support',
    'Billing',
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
                  child: Text('CONTACT ADMIN',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
                ),
                smallInput(),
                SizedBox(height: 20),
                bigInput(),
                SizedBox(height: 40),
                GestureDetector(
                    onTap: () => alert(context), child: largeBtn('Message'))
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

  var alertStyle = AlertStyle(
    isCloseButton: true,
    backgroundColor: UniversalVariables.gradientColorEnd,
    animationType: AnimationType.shrink,
    isOverlayTapDismiss: true,
    animationDuration: Duration(milliseconds: 400),
    titleStyle: TextStyle(fontSize: 16.0),
  );

  alert(BuildContext context) {
    return Alert(
        gradient: UniversalVariables.fabGradient,
        style: alertStyle,
        context: context,
        title: "",
        content: Column(children: <Widget>[
          SizedBox(height: 10),
          Icon(
            Ionicons.ios_checkmark_circle_outline,
            color: Colors.white,
            size: 75,
          ),
          Text('Message Sent Successfully',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
        ]),
        buttons: [
          DialogButton(
            onPressed: () => Navigator.of(context).pop(),
            color: Colors.transparent,
            child: Text('Okay Thanks!',
                style: TextStyle(fontSize: 14, color: Colors.white)),
          )
        ]).show();
  }

  Widget smallInput() {
    return Container(
      height: 45,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border:
            Border.all(color: UniversalVariables.gradientColorEnd, width: 1),
      ),
      child: DropdownButton(
        itemHeight: 50,
        underline: SizedBox.shrink(),
        isExpanded: true,
        hint: Text('Select Department',
            style:
                TextStyle(color: Colors.black)), // Not necessary for Option 1
        value: _selectedLocation,
        onChanged: (newValue) {
          setState(() {
            _selectedLocation = newValue;
          });
        },
        items: _locations.map((location) {
          return DropdownMenuItem(
            child: new Text(location, style: TextStyle(color: Colors.black)),
            value: location,
          );
        }).toList(),
      ),
    );
  }

  Widget bigInput() {
    return Container(
        height: 120,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border:
              Border.all(color: UniversalVariables.gradientColorEnd, width: 1),
        ),
        child: TextField(
            decoration: InputDecoration.collapsed(
                hintText: 'A brief description of your enquiry')));
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
}
