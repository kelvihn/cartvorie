import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:cartvorie/screens/driver/search_page.dart';
import 'package:cartvorie/screens/driver/profile.dart';

class TransactionHistory extends StatefulWidget {
  @override
  _TransactionHistoryState createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
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
                child: Text('WALLET',
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Text('Transaction History',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: UniversalVariables.gradientColorEnd)),
              ),
              SizedBox(height: 10),
              tableHead(),
              dropBox(),
              dropBox(),
              dropBox()
            ]))));
  }

  Widget tableHead() {
    return Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(children: <Widget>[
                Text('Amount', style: TextStyle(fontWeight: FontWeight.w600)),
                SizedBox(width: 30),
                Text('Narration',
                    style: TextStyle(fontWeight: FontWeight.w600)),
              ]),
              Container(
                width: 110,
                alignment: Alignment.centerLeft,
                child:
                    Text('Date', style: TextStyle(fontWeight: FontWeight.w600)),
              )
            ]));
  }

  Widget dropBox() {
    return Container(
        height: 120,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.indigo[50].withOpacity(.5),
            borderRadius: BorderRadius.circular(5)),
        child: Center(
            child: ExpansionTile(
          childrenPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          leading: Text('\$1,000'),
          title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Wallet Payout',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                Text('5/6/2020',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: UniversalVariables.gradientColorEnd)),
              ]),
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(children: <Widget>[
                    Text('Status',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          // color:UniversalVariables.gradientColorEnd
                        )),
                    SizedBox(width: 5),
                    Text('Completed',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: UniversalVariables.gradientColorEnd))
                  ]),
                  Row(children: <Widget>[
                    Text('Wallet Balance',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          // color:UniversalVariables.gradientColorEnd
                        )),
                    SizedBox(width: 5),
                    Text('\$150',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: UniversalVariables.gradientColorEnd))
                  ])
                ])
          ],
        )));
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
}
