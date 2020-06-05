import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              backgroundColor: Colors.white,
              elevation: 1.0,
            ),
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
                child: Column(children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Text('SEARCH',
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
              ),
              searchBox()
            ]))));
  }

  Widget searchBox() {
    return Container(
        padding: EdgeInsets.only(left: 20, right: 5, top: 15),
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(25)),
        child: TextField(
            autofocus: true,
            decoration: InputDecoration.collapsed(hintText: 'Search')));
  }
}
