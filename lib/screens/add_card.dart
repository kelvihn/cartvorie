import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AddCard extends StatefulWidget {
  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  TextEditingController cardInfo =
      TextEditingController(text: "0000 0000 0000 0000");
  TextEditingController expiresController =
      TextEditingController(text: "MM/YY");
  TextEditingController cvvController = TextEditingController(text: "123");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        header(),
        SizedBox(height: 20),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          width: MediaQuery.of(context).size.width,
          child: Text('Card Information (Debit/Credit)',
              style: TextStyle(fontWeight: FontWeight.w600)),
        ),
        SizedBox(height: 8),
        bigInput(),
        SizedBox(height: 20),
        smallInputRow(),
        SizedBox(height: 20),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          width: MediaQuery.of(context).size.width,
          child:
              Text('Card Name', style: TextStyle(fontWeight: FontWeight.w600)),
        ),
        SizedBox(height: 5),
        normalInput(),
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          width: MediaQuery.of(context).size.width,
          child: Text('Address', style: TextStyle(fontWeight: FontWeight.w600)),
        ),
        SizedBox(height: 5),
        normalInput(),
        SizedBox(height: 30),
        GestureDetector(
            onTap: () => alert(context), child: largeBtn2('Save/Continue'))
      ],
    ))));
  }

  Widget header() {
    return Stack(
      children: <Widget>[
        Container(
            width: MediaQuery.of(context).size.width,
            height: 120,
            decoration: BoxDecoration(gradient: UniversalVariables.fabGradient),
            child: Center(
                child: Text('Add Debit Card',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18)))),
        Positioned(
          left: 10,
          top: 35,
          child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop()),
        )
      ],
    );
  }

  Widget bigInput() {
    return Container(
        height: 80,
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.grey[50],
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(5)),
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Card Number',
                style:
                    TextStyle(fontWeight: FontWeight.w500, color: Colors.grey)),
            TextField(
                controller: cardInfo,
                decoration: InputDecoration.collapsed(hintText: ''))
          ],
        )));
  }

  Widget smallInputRow() {
    return Container(
        height: 120,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Center(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                height: 80,
                width: MediaQuery.of(context).size.width * 0.40,
                decoration: BoxDecoration(
                    color: Colors.grey[50],
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Expires', style: TextStyle(fontSize: 12)),
                      TextField(
                          controller: expiresController,
                          decoration: InputDecoration.collapsed(hintText: ''))
                    ]),
              ),
              Container(
                height: 80,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: MediaQuery.of(context).size.width * 0.40,
                decoration: BoxDecoration(
                    color: Colors.grey[50],
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('CVV', style: TextStyle(fontSize: 12)),
                      TextField(
                          controller: cvvController,
                          decoration: InputDecoration.collapsed(hintText: ''))
                    ]),
              )
            ])));
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
          Text('Card Details Updated Successfully',
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
          Text('Your card details have been updated successfully',
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

  /*
  Same as primary address child,
  purple is too much,
  change image
  */

  Widget normalInput() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 45,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.grey[50],
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(5)),
        child: Center(
            child: TextField(
                decoration: InputDecoration.collapsed(hintText: ''))));
  }

  Widget largeBtn2(String text) {
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

  Widget largeBtn(String text) {
    return Container(
        height: 50,
        width: 200,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.white),
            //gradient: UniversalVariables.fabGradient,
            borderRadius: BorderRadius.circular(5)),
        child: Center(
            child: Text(text,
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold))));
  }
}
