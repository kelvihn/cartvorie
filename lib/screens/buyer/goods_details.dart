import 'package:cartvorie/screens/buyer/profile.dart';
import 'package:cartvorie/screens/buyer/review_order.dart';
import 'package:cartvorie/screens/buyer/search_page.dart';
import 'package:cartvorie/screens/buyer/start_shopping.dart';
import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class GoodsDetails extends StatefulWidget {
  @override
  _GoodsDetailsState createState() => _GoodsDetailsState();
}

class _GoodsDetailsState extends State<GoodsDetails> {
  List<String> _locations = [
    'Recieved',
    'Refunded',
    'Cancelled',
    'Delivered',
    'Rejected',
  ]; // Option 2
  String _selectedLocation;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                customAppBar(),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Text('GOODS DETAILS',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
                ),
                SizedBox(height: 20),
                contentBox(),
                largeBtn('Save')
              ],
            ))));
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
                          width: 230,
                          child: Center(
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (_) => SearchPage()));
                                    },
                                    child: Icon(Icons.search, size: 30)),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (_) => ReviewOrder()));
                                    },
                                    child: Icon(Icons.shopping_cart, size: 30)),
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
            Positioned(
                top: 15,
                right: 125,
                child: Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: UniversalVariables.gradientColorStart),
                ))
          ],
        ));
  }

  Widget contentBox() {
    return Container(
        height: 550,
        //color: Colors.grey,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Order Number:',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      )),
                  Text('2345:',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: UniversalVariables.gradientColorEnd))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Driver:',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      )),
                  Text('Ose:',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: UniversalVariables.gradientColorEnd))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Amount:',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      )),
                  Text('\$40,000',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: UniversalVariables.gradientColorEnd))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Store 1:',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      )),
                  Text('Oba Market',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: UniversalVariables.gradientColorEnd))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Store 2:',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      )),
                  Text('African Market',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: UniversalVariables.gradientColorEnd))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Store 3:',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      )),
                  Text('Laura meat store',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: UniversalVariables.gradientColorEnd))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Goods:',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      )),
                  Column(children: <Widget>[
                    Text('1.1 Bag of Rice',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: UniversalVariables.gradientColorEnd)),
                    SizedBox(height: 10),
                    Text('2.2 Can of Drinks',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: UniversalVariables.gradientColorEnd))
                  ]),
                  Column(children: <Widget>[
                    Row(children: <Widget>[
                      Image.asset('assets/images/rice_bag.jpg', height: 20),
                      SizedBox(width: 5),
                      Text('(Oba Market)',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: UniversalVariables.gradientColorEnd))
                    ]),
                    SizedBox(height: 5),
                    Row(children: <Widget>[
                      Image.asset('assets/images/groc1.jpg', height: 20),
                      SizedBox(width: 5),
                      Text('(African Market)',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: UniversalVariables.gradientColorEnd))
                    ])
                  ])
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Items:',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      )),
                  Text('2',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: UniversalVariables.gradientColorEnd))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Tip Rider:',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      )),
                  OutlineButton(
                    onPressed: () {},
                    child: Text('Enter amount \$'),
                    color: UniversalVariables.gradientColorEnd,
                  ),
                  RaisedButton(
                      onPressed: () {},
                      color: UniversalVariables.gradientColorEnd,
                      child: Text('Checkout tip',
                          style: TextStyle(color: Colors.white, fontSize: 12)))
                ],
              ),
              bigInput(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Rate:',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      )),
                  RatingBar(
                    initialRating: 0,
                    itemSize: 25,
                    minRating: 0,
                    glowColor: UniversalVariables.gradientColorEnd,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,

                    //itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: UniversalVariables.gradientColorEnd,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ],
              ),
              dropDownBtn()
            ]));
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

  Widget bigInput() {
    return Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        decoration: BoxDecoration(
          border:
              Border.all(color: UniversalVariables.gradientColorEnd, width: 1),
        ),
        child: TextField(
            decoration: InputDecoration.collapsed(hintText: 'Leave a review')));
  }

  Widget dropDownBtn() {
    return Container(
        height: 35,
        width: 150,
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: UniversalVariables.fabGradient),
        child: Center(
            child: DropdownButton(
          itemHeight: 50,
          underline: SizedBox.shrink(),
          isExpanded: true,
          iconDisabledColor: Colors.white,
          iconEnabledColor: Colors.white,
          iconSize: 14,
          style: TextStyle(color: Colors.white, fontSize: 14),
          hint: Text('Update Status',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14)), // Not necessary for Option 1
          value: _selectedLocation,
          onChanged: (newValue) {
            setState(() {
              _selectedLocation = newValue;
            });
          },
          items: _locations.map((location) {
            return DropdownMenuItem(
              child: new Text(location,
                  style: TextStyle(color: Colors.grey[400], fontSize: 14)),
              value: location,
            );
          }).toList(),
        )));
  }
}
