import 'package:cartvorie/controllers/user_controller.dart';
import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:cartvorie/screens/confirm_pin.dart';
import 'package:cartvorie/screens/login_page.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends StateMVC<Registration> {
  UserController _con;

  _RegistrationState() : super(UserController()) {
    _con = controller;
  }

  _notifier(String serverRes) {
    _con.scaffoldKey.currentState
        .showSnackBar(SnackBar(content: Text(serverRes)));
  }

  TextEditingController firstnameController = new TextEditingController();
  TextEditingController lastnameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();

  List<String> _locations = [
    'Buyer',
    'Driver',
  ]; // Option 2
  String _selectedLocation;
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
                child: Column(children: <Widget>[
              Image.asset('assets/images/logo_dark.png', height: 120),
              SizedBox(height: 20),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[textRow()]),
              SizedBox(height: 40),
              Text('Create an Account',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
              SizedBox(height: 15),
              accountBox(),
              SizedBox(height: 20),
              buildTextInput('First name', firstnameController),
              buildTextInput('Last name', lastnameController),
              buildTextInput('Email', emailController),
              buildTextInput('Password', passwordController),
              buildTextInput('Confirm Password', confirmPasswordController),
              GestureDetector(
                  onTap: () {
                    if (emailController.text == '' ||
                        passwordController.text == '' ||
                        confirmPasswordController.text == '' ||
                        firstnameController.text == '' ||
                        lastnameController.text == '') {
                      return _notifier(
                          'Please, kindly fill all required details.');
                    } else if (passwordController.text !=
                        confirmPasswordController.text) {
                      return _notifier('Password do not match');
                    } else {
                      _con.verifyEmail(
                          accountType: _selectedLocation,
                          email: emailController.text,
                          lastname: lastnameController.text,
                          firstname: firstnameController.text,
                          password: passwordController.text);
                    }
                  },
                  child: largeBtn('Create an Account')),
              SizedBox(height: 10),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Already have an account?',
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
                      child: Text('Login',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: UniversalVariables.gradientColorEnd)),
                    )
                  ]),
              SizedBox(height: 10),
            ]))));
  }

  Widget textRow() {
    return Container(
        width: 200,
        child: Center(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              OutlineButton(
                  color: UniversalVariables.gradientColorEnd,
                  onPressed: () {},
                  child: Text('Sign Up',
                      style: TextStyle(
                          fontSize: 18,
                          color: UniversalVariables.gradientColorEnd))),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Login',
                      style: TextStyle(
                          fontSize: 18,
                          color: UniversalVariables.gradientColorEnd)))
            ])));
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

  Widget accountBox() {
    return Container(
        padding: EdgeInsets.all(5),
        width: 150,
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            border: Border.all(
                width: 1, color: UniversalVariables.gradientColorEnd)),
        child: Center(
          child: DropdownButton(
            itemHeight: 50,
            underline: SizedBox.shrink(),
            isExpanded: true,
            hint: Text('Account Type',
                style: TextStyle(
                    color: UniversalVariables
                        .gradientColorEnd)), // Not necessary for Option 1
            value: _selectedLocation,
            onChanged: (newValue) {
              setState(() {
                _selectedLocation = newValue;
              });
            },
            items: _locations.map((location) {
              return DropdownMenuItem(
                child: new Text(location,
                    style:
                        TextStyle(color: UniversalVariables.gradientColorEnd)),
                value: location,
              );
            }).toList(),
          ),
        ));
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
