import 'package:cartvorie/screens/buyer/home_page.dart';
import 'package:cartvorie/screens/driver/home_page.dart';
import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cartvorie/screens/registration.dart';
import 'package:cartvorie/screens/recover_password.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cartvorie/controllers/user_controller.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends StateMVC<LoginPage> {
  UserController _con;

  _LoginPageState() : super(UserController()) {
    _con = controller;
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String driverLogin = 'cartvoriedriver@gmail.com';
  String buyerLogin = 'cartvoriebuyer@gmail.com';
  String password = 'cartvorie123';

  _decipherLogic() {
    if (emailController.text == '' || passwordController.text == '') {
      return _notifier('Please, kindly fill all required details.');
    } else if (emailController.text == driverLogin &&
        password == passwordController.text) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => DriverHomePage()));
    } else if (emailController.text == buyerLogin &&
        password == passwordController.text) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => BuyerHomePage()));
    } else {
      return _notifier('These details seems to be wrong. Please try again.');
    }
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  _notifier(String serverRes) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(serverRes)));
  }

  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            key: _con.scaffoldKey,
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              backgroundColor: Colors.white,
              elevation: 0.0,
            ),
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  Image.asset('assets/images/logo_dark.png', height: 120),
                  SizedBox(height: 20),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[textRow()]),
                  SizedBox(height: 40),
                  Text('Login',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.black)),
                  buildTextInput('Email', emailController),
                  buildTextInput('Password', passwordController),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => RecoverPassword()));
                            },
                            child: Text('Recover Password',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        UniversalVariables.gradientColorEnd))),
                      ]),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Remember me',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.black)),
                        Switch(
                          value: isSwitched,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                              print(isSwitched);
                            });
                          },
                          activeTrackColor: Colors.lightGreenAccent,
                          activeColor: Colors.green,
                        )
                      ]),
                  SizedBox(height: 10),
                  GestureDetector(
                      onTap: () {
                        if (emailController.text == '' ||
                            passwordController.text == '') {
                          return _notifier(
                              'Please, kindly fill all required details.');
                        } else {
                          _con.login(
                              email: emailController.text,
                              password: passwordController.text);
                        }
                      },
                      child: largeBtn('Login')),
                  SizedBox(height: 10),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Don\'t have an account',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: UniversalVariables.gradientColorEnd)),
                        SizedBox(width: 5),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => Registration()));
                            },
                            child: Text('Sign Up',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        UniversalVariables.gradientColorEnd))),
                      ])
                ]))));
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

  Widget textRow() {
    return Container(
        width: 200,
        child: Center(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => Registration()));
                  },
                  child: Text('Sign Up',
                      style: TextStyle(
                          fontSize: 18,
                          color: UniversalVariables.gradientColorEnd))),
              OutlineButton(
                  color: UniversalVariables.gradientColorEnd,
                  onPressed: () {},
                  child: Text('Login',
                      style: TextStyle(
                          fontSize: 18,
                          color: UniversalVariables.gradientColorEnd)))
            ])));
  }

  Widget buildTextInput(String hintText, TextEditingController controller) {
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
        controller: controller,
        decoration: InputDecoration.collapsed(hintText: hintText),
      )),
    );
  }
}

//The search product/ search store.  error
