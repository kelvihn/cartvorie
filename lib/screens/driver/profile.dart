import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:cartvorie/screens/driver/search_page.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<String> _locations = [
    'Online',
    'Offline',
    'Away',
  ]; // Option 2
  String _selectedLocation;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
                child: Column(children: <Widget>[
              customAppBar(),
              Container(
                  //alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('UPDATE PROFILE',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18)),
                        shareIconBox()
                      ])),
              SizedBox(height: 5),
              Stack(
                children: <Widget>[
                  ClipOval(
                    child: Image.asset(
                      'assets/images/sophia.jpg',
                      height: 90,
                    ),
                  ),
                  Positioned(right: 0, bottom: 0, child: cameraBox())
                ],
              ),
              SizedBox(height: 5),
              dropDownBtn(),
              SizedBox(height: 10),
              buildTextInput('Full Name'),
              buildTextInput('Phone Number'),
              buildTextInput('Email'),
              buildTextInput('Address'),
              buildTextInput('State'),
              //buildTextInput('Confirm Password'),
              GestureDetector(
                  onTap: () => alert(context),
                  child: largeBtn('Update Profile'))
            ]))));
  }

  Widget shareIconBox() {
    return Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
                width: 1, color: UniversalVariables.gradientColorEnd)),
        child: Center(
            child: Icon(Feather.share_2,
                color: UniversalVariables.gradientColorEnd)));
  }

  Widget cameraBox() {
    return Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: UniversalVariables.fabGradient),
        child: Center(child: Icon(Ionicons.ios_camera, color: Colors.white)));
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

  Widget buildTextInput(String hintText) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
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
          hint: Text('Online',
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
          Text('Profile Updated Successfully',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
          SizedBox(height: 10),
          Icon(
            Ionicons.ios_checkmark_circle_outline,
            color: Colors.white,
            size: 75,
          ),
          Text('Your profile has been updated successfully.',
              style: TextStyle(color: Colors.white, fontSize: 14),
              textAlign: TextAlign.center),
        ]),
        buttons: [
          DialogButton(
            onPressed: () => Navigator.of(context).pop(),
            color: Colors.transparent,
            child: Text('Okay Thanks',
                style: TextStyle(fontSize: 14, color: Colors.white)),
          )
        ]).show();
  }
}
