import 'package:cartvorie/screens/driver/account_details.dart';
import 'package:cartvorie/screens/driver/faq_page.dart';
import 'package:cartvorie/screens/driver/profile.dart';
import 'package:cartvorie/screens/driver/update_password.dart';
import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:cartvorie/screens/driver/search_page.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
                child: Column(children: <Widget>[
              customAppBar(),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Text('SETTINGS',
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => Profile()));
                  },
                  child: dataBox(Icons.person_outline, 'Profile Details',
                      'Update your personal details')),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => AccountDetails()));
                  },
                  child: dataBox(FontAwesome.bank, 'Bank Account Details',
                      'Update your bank account details')),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => UpdatePassword()));
                  },
                  child: dataBox(
                      EvilIcons.unlock, 'Password', 'Update your password')),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => Faq()));
                  },
                  child:
                      dataBox(Icons.help, 'FAQ', 'Frequently asked questions')),
              dataBox(Icons.exit_to_app, 'Logout', 'Logout from your account')
            ]))));
  }

  Widget dataBox(IconData icon, String title, String subtitle) {
    return Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        padding: EdgeInsets.only(top: 10),
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
        ], borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: ListTile(
            leading: iconBox(icon),
            title: Text(title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  //  color: UniversalVariables.gradientColorEnd,
                  fontSize: 18,
                )),
            subtitle: Text(subtitle,
                style: TextStyle(
                  color: UniversalVariables.gradientColorEnd,
                  fontSize: 14,
                )),
            trailing: IconButton(
                icon: Icon(Icons.arrow_forward_ios, size: 30),
                onPressed: () {})));
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

  Widget iconBox(IconData icon) {
    return Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: UniversalVariables.gradientColorStart.withOpacity(.2),
            borderRadius: BorderRadius.circular(25)),
        child: Center(child: Icon(icon, size: 30, color: Colors.black)));
  }
}
