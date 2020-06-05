import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:cartvorie/screens/policies.dart';

class PolicySettings extends StatefulWidget {
  @override
  _PolicySettingsState createState() => _PolicySettingsState();
}

class _PolicySettingsState extends State<PolicySettings> {
  List<String> _locations = [
    'Activate account',
    'Deactivate account',
  ]; // Option 2
  String _selectedLocation;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(children: <Widget>[
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/bg.jpg'), fit: BoxFit.cover)),
      ),
      Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                0.1,
                0.4,
                0.7,
                0.9
              ],
                  colors: [
                Colors.white.withOpacity(.9),
                Colors.white.withOpacity(.9),
                Colors.white.withOpacity(.9),
                Colors.white.withOpacity(.9),
              ])),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                firstBox(),
                SizedBox(height: 40),
                optionBox()
              ]))
    ])));
  }

  Widget firstBox() {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 30, bottom: 35),
          height: 100,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: UniversalVariables.fabGradient,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              )),
          child: Center(
              child: Text('TERMS & CONDITIONS',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18))),
        ),
        Positioned(
            top: 25,
            left: 8,
            child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop())),
      ],
    );
  }

  Widget text(String text) {
    return Container(
        height: 70,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              text,
              style: TextStyle(
                  color: Colors.blue[900], fontWeight: FontWeight.bold),
            )
          ],
        ));
  }

  Widget whiteBox() {
    return Container(
        alignment: Alignment.centerLeft,
        height: 380,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.white,
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
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              text('Terms & Conditions'),
              Divider(),
              text('Policy'),
              Divider(),
              text('Delivery Term'),
              Divider(),
              text('Terms of Purchase'),
            ]));
  }

  Widget optionBox() {
    return Container(
        child: Center(
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            whiteBox(),
            Container(
                alignment: Alignment.centerLeft,
                height: 380,
                width: 140,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 180,
                      child: RaisedButton(
                          color: UniversalVariables.gradientColorEnd,
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => PoliciesPage(
                                    policy: 'Terms & Conditions')));
                          },
                          child: Text('UPDATE',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16))),
                    ),
                    Container(
                      height: 50,
                      width: 180,
                      child: RaisedButton(
                          color: UniversalVariables.gradientColorEnd,
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) =>
                                    PoliciesPage(policy: 'Policy')));
                          },
                          child: Text('UPDATE',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16))),
                    ),
                    Container(
                      height: 50,
                      width: 180,
                      child: RaisedButton(
                          color: UniversalVariables.gradientColorEnd,
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) =>
                                    PoliciesPage(policy: 'Delivery Term')));
                          },
                          child: Text('UPDATE',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16))),
                    ),
                    Container(
                      height: 50,
                      width: 180,
                      child: RaisedButton(
                          color: UniversalVariables.gradientColorEnd,
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) =>
                                    PoliciesPage(policy: 'Terms of Purchase')));
                          },
                          child: Text('UPDATE',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16))),
                    ),
                  ],
                ))
          ]),
    ));
  }

  Widget profileBar() {
    return Container(
      alignment: Alignment.centerRight,
      height: 25,
      width: 190,
      padding: EdgeInsets.only(left: 20),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.white, width: 1)),
      child: DropdownButton(
        itemHeight: 50,
        underline: SizedBox.shrink(),
        isExpanded: true,
        //isDense: true,
        hint: Text('Profile Settings',
            style: TextStyle(
                fontSize: 12,
                color: Colors.white)), // Not necessary for Option 1
        value: _selectedLocation,
        onChanged: (newValue) {
          setState(() {
            _selectedLocation = newValue;
          });
        },
        items: _locations.map((location) {
          return DropdownMenuItem(
            child: new Text(location,
                style: TextStyle(color: Colors.grey[500], fontSize: 12)),
            value: location,
          );
        }).toList(),
      ),
    );
  }

  Widget smallBox() {
    return Container(
        height: 25,
        width: 30,
        decoration: BoxDecoration(color: Colors.white),
        child: Icon(Icons.arrow_drop_up, color: Colors.blue[900]));
  }
}
