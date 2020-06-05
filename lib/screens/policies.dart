import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter/material.dart';

class PoliciesPage extends StatefulWidget {
  final String policy;

  const PoliciesPage({Key key, this.policy}) : super(key: key);
  @override
  _PoliciesPageState createState() => _PoliciesPageState();
}

class _PoliciesPageState extends State<PoliciesPage> {
  TextEditingController policyController = TextEditingController(
      text:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomPadding: false,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(children: <Widget>[
                        firstBox(),
                        SizedBox(height: 30),
                        textBox()
                      ]),
                      updateBtn()
                    ],
                  ))
            ])));
  }

  Widget textBox() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: Colors.black87),
            borderRadius: BorderRadius.circular(5)),
        child: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            controller: policyController,
            decoration: InputDecoration(enabledBorder: InputBorder.none)));
  }

  Widget updateBtn() {
    return Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(20),
        height: 50,
        width: 130,
        decoration: BoxDecoration(
          color: UniversalVariables.gradientColorEnd,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
            child: Text('UPDATE',
                style: TextStyle(fontSize: 14, color: Colors.white))));
  }

  Widget firstBox() {
    return Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 60),
            height: 120,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: UniversalVariables.fabGradient,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                )),
            child: Center(
              child: Text(
                widget.policy,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
                textAlign: TextAlign.center,
              ),
            )),
        Positioned(
            top: 30,
            left: 8,
            child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop()))
      ],
    );
  }
}
