import 'package:flutter/material.dart';
import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headerImage('assets/images/delivery4.jpg'),
        SizedBox(height: 15),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                Icon(Icons.phone, color: UniversalVariables.gradientColorEnd),
                SizedBox(width: 10),
                Text('Mobile Numbers',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                        color: UniversalVariables.gradientColorEnd))
              ],
            )),
        Container(
            height: 70,
            margin: EdgeInsets.only(left: 50),
            width: MediaQuery.of(context).size.width,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('+1 (596) 345 2392',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  Text('+234 3459 4881',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  Text('+44 (596) 345 2392',
                      style: TextStyle(fontWeight: FontWeight.w500))
                ])),
        SizedBox(height: 20),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                Icon(Icons.mail, color: UniversalVariables.gradientColorEnd),
                SizedBox(width: 10),
                Text('Support Email',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                        color: UniversalVariables.gradientColorEnd))
              ],
            )),
        Container(
            height: 50,
            margin: EdgeInsets.only(left: 50),
            width: MediaQuery.of(context).size.width,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('support.catvorie@gmail.com',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  Text('helpdesk.catvorie@gmail.com',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                ])),
        SizedBox(height: 20),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                Icon(AntDesign.android,
                    color: UniversalVariables.gradientColorEnd),
                SizedBox(width: 10),
                Text('Socials',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                        color: UniversalVariables.gradientColorEnd))
              ],
            )),
        Container(
            height: 100,
            margin: EdgeInsets.only(left: 50),
            width: MediaQuery.of(context).size.width,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Icon(Ionicons.logo_whatsapp, color: Colors.green),
                    Text('+234 454 8366',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                  ]),
                  Row(children: [
                    Icon(AntDesign.facebook_square, color: Colors.blue[900]),
                    Text('https//facebook.com/cartvorie',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                  ]),
                  Row(children: [
                    Icon(AntDesign.twitter, color: Colors.blue),
                    Text('@cartvorie_app',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                  ]),
                ])),
      ],
    ))));
  }

  Widget headerImage(String image) {
    return Stack(
      children: <Widget>[
        Container(
          height: 220,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        ),
        Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 220,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: UniversalVariables.gradientColorEnd.withOpacity(.7)),
            child: Row(
              children: [
                Icon(Icons.contact_phone, size: 35, color: Colors.white),
                SizedBox(width: 20),
                Text('CONTACT US',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w700))
              ],
            )),
        Positioned(
            left: 10,
            top: 5,
            child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop()))
      ],
    );
  }

  Widget headerBtn(String text) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.all(5),
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: UniversalVariables.fabGradient,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.phone, color: Colors.white),
            SizedBox(width: 10),
            Text(text, style: TextStyle(color: Colors.white, fontSize: 15))
          ],
        )));
  }
}
