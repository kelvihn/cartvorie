import 'package:cartvorie/controllers/user_controller.dart';
import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:cartvorie/screens/login_page.dart';

class ConfirmPin extends StatefulWidget {
  final String pin;
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String accountType;

  const ConfirmPin(
      {Key key,
      this.pin,
      this.email,
      this.password,
      this.firstName,
      this.lastName,
      this.accountType})
      : super(key: key);
  @override
  _ConfirmPinState createState() => _ConfirmPinState();
}

class _ConfirmPinState extends StateMVC<ConfirmPin> {
  UserController _con;

  _ConfirmPinState() : super(UserController()) {
    _con = controller;
  }

  _notifier(String serverRes) {
    _con.scaffoldKey.currentState
        .showSnackBar(SnackBar(content: Text(serverRes)));
  }

  String pinCode;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            key: _con.scaffoldKey,
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
              Text('Verify your email',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: UniversalVariables.gradientColorEnd),
                  textAlign: TextAlign.center),
              SizedBox(height: 40),
              Container(
                  width: 250,
                  child: Center(
                      child: Text('Enter the 6-digit OTP sent to your email',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: UniversalVariables.gradientColorStart),
                          textAlign: TextAlign.center))),
              SizedBox(height: 40),
              Container(
                  child: Center(
                child: PinEntryTextField(
                  //showFieldAsBox: true,
                  fieldWidth: 30.0,
                  fields: 6,

                  onSubmit: (String pin) {
                    setState(() {
                      pinCode = pin;
                    }); //end showDialog()
                  }, // end onSubmit
                ),
              )),
              SizedBox(height: 40),
              GestureDetector(
                  onTap: () {
                    if (pinCode != widget.pin) {
                      _notifier('Incorrect pin');
                    } else {
                      _con.register(
                          email: widget.email,
                          firstname: widget.firstName,
                          lastname: widget.lastName,
                          password: widget.password,
                          accountType: widget.accountType);
                    }
                  },
                  child: largeBtn('Authenticate')),
              SizedBox(height: 10),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Did\'nt get a code?',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: UniversalVariables.gradientColorEnd)),
                    SizedBox(width: 5),
                    Text('Resend Code',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: UniversalVariables.gradientColorEnd)),
                  ])
            ]))));
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
          Text('Email Verification',
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
          Text('Your email has been successfully verified.',
              style: TextStyle(color: Colors.white, fontSize: 14),
              textAlign: TextAlign.center),
        ]),
        buttons: [
          DialogButton(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => LoginPage())),
            color: Colors.transparent,
            child: Text('Proceed to Login',
                style: TextStyle(fontSize: 14, color: Colors.white)),
          )
        ]).show();
  }
}
