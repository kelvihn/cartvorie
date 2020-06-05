import 'package:cartvorie/screens/login_page.dart';
import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:cartvorie/screens/new_password.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_icons/flutter_icons.dart';

class RecoverPassword extends StatefulWidget {
  @override
  _RecoverPasswordState createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword> {
  String pinCode;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              backgroundColor: Colors.white,
              elevation: 0.0,
            ),
            body: SingleChildScrollView(
                child: Column(children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image.asset('assets/images/logo_dark.png', height: 120)
                ],
              ),
              SizedBox(height: 30),
              Text('Recover Password',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: UniversalVariables.gradientColorEnd),
                  textAlign: TextAlign.center),
              SizedBox(height: 40),
              Container(
                  width: 250,
                  child: Center(
                      child: Text(
                          'Enter your email. A password reset link will be sent to your email.',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: UniversalVariables.gradientColorStart),
                          textAlign: TextAlign.center))),
              SizedBox(height: 40),
              buildTextInput('Email'),
              SizedBox(height: 40),
              GestureDetector(
                  onTap: () {
                    alert(context);
                  },
                  child: largeBtn('Recover')),
              SizedBox(height: 10),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Don\'t have an account?',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: UniversalVariables.gradientColorEnd)),
                    SizedBox(width: 5),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => LoginPage()));
                        },
                        child: Text('Sign Up',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: UniversalVariables.gradientColorEnd))),
                  ])
            ]))));
  }

  Widget buildTextInput(String hintText) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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

  Widget largeBtn(String text) {
    return Container(
        height: 60,
        margin: EdgeInsets.symmetric(vertical: 10),
        width: MediaQuery.of(context).size.width * 0.70,
        decoration: BoxDecoration(
            gradient: UniversalVariables.fabGradient,
            borderRadius: BorderRadius.circular(25)),
        child: Center(
            child: Text(text,
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold))));
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
          Text('Recovery Link Sent',
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
          Text('A recover link has been sent to your email.',
              style: TextStyle(color: Colors.white, fontSize: 14),
              textAlign: TextAlign.center),
        ]),
        buttons: [
          DialogButton(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => NewPassword())),
            color: Colors.transparent,
            child: Text('Okay Thanks!',
                style: TextStyle(fontSize: 14, color: Colors.white)),
          )
        ]).show();
  }
}
