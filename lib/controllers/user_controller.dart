import 'package:cartvorie/models/user_model.dart';
import 'package:cartvorie/screens/buyer/home_page.dart';
import 'package:cartvorie/screens/driver/home_page.dart';
import 'package:cartvorie/screens/login_page.dart';
import 'package:cartvorie/screens/confirm_pin.dart';
import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import '../repository/user_repository.dart' as repository;
import 'package:global_configuration/global_configuration.dart';
import 'dart:convert';
import 'dart:io';

class UserController extends ControllerMVC {
  GlobalKey<ScaffoldState> scaffoldKey;

  UserController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }

  dynamic loadingDialog() {
    return showDialog(
        barrierDismissible: false,
        context: scaffoldKey.currentContext,
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                backgroundColor: Colors.black54,
                children: [
                  Center(
                      child: Column(children: [
                    CircularProgressIndicator(
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.white)),
                    SizedBox(height: 10),
                    Text('Please wait...',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ))
                  ]))
                ],
              ));
        });
  }

  Future<void> login({email, password}) async {
    loadingDialog();
    repository.login(email: email, password: password).then((value) {
      //print(value.apiToken);
      if (value != null && value.id != null) {
        Navigator.pop(scaffoldKey.currentContext);
        if (value.accountType == 'buyer') {
          Navigator.of(scaffoldKey.currentContext).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => BuyerHomePage()),
              (route) => false);
        } else {
          Navigator.of(scaffoldKey.currentContext).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => DriverHomePage()),
              (route) => false);
        }
      } else {
        Navigator.pop(scaffoldKey.currentContext);
        scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('error'),
        ));
      }
    });
  }

  Future<User> register({
    email,
    password,
    firstname,
    accountType,
    lastname,
  }) async {
    loadingDialog();
    final String url = 'https://test.codtrix.com/api/v1/register';
    final client = new http.Client();
    try {
      final response = await client.post(
        url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: json.encode({
          'email': email,
          'password': password,
          'firstname': firstname,
          'lastname': lastname,
          'account_type': accountType
        }),
      );
      if (response.statusCode == 201) {
        print(response.body);
        var success = json.decode(response.body)['success'];
        if (success == true) {
          Navigator.pop(scaffoldKey.currentContext);
          alert(context);
        }
      } else {
        Navigator.pop(scaffoldKey.currentContext);
        print(response.body);
        var message = json.decode(response.body)['error'][0];
        scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('$message'),
        ));
      }
    } catch (e) {
      Navigator.pop(scaffoldKey.currentContext);
      print(e);
    }
  }

/*
  Future<void> register(
      {email, password, firstname, accountType, lastname}) async {
    loadingDialog();
    repository
        .register(
            email: email,
            password: password,
            accountType: accountType,
            firstname: firstname,
            lastname: lastname)
        .then((value) {
      if (value != null || value.id != null) {
        Navigator.pop(scaffoldKey.currentContext);
        alert(context);
      } else {
        scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('An error occured. Please try again'),
        ));
      }
    });
  }
  */

  Future<void> verifyEmail(
      {firstname, lastname, email, password, accountType}) async {
    loadingDialog();
    final String url = 'https://test.codtrix.com/api/v1/verify';
    final client = new http.Client();
    final response = await client.post(
      url,
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: json.encode({'email': email}),
    );

    if (response.statusCode == 201) {
      print(response.body);
      if (json.decode(response.body)['status'] == true) {
        String code = json.decode(response.body)['code'].toString();
        Navigator.of(scaffoldKey.currentContext).pushReplacement(
            MaterialPageRoute(
                builder: (context) => ConfirmPin(
                    accountType: accountType,
                    pin: code,
                    email: email,
                    password: password,
                    firstName: firstname,
                    lastName: lastname)));
      } else if (json.decode(response.body)['status'] == false) {
        Navigator.pop(scaffoldKey.currentContext);
        print(response.body);
        var message = json.decode(response.body)['message'];
        scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('$message'),
        ));
      }
    } else {
      Navigator.pop(scaffoldKey.currentContext);
      scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('An error occured. Please try again'),
      ));
    }
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
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => LoginPage()),
                (route) => false),
            color: Colors.transparent,
            child: Text('Proceed to Login',
                style: TextStyle(fontSize: 14, color: Colors.white)),
          )
        ]).show();
  }
}

//Navigator.of(context).push(MaterialPageRoute(builder:(context)=>Login());
