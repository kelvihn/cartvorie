import 'package:cartvorie/screens/driver/delivery_request.dart';
import 'package:cartvorie/utils/universal_variables.dart';
import 'package:cartvorie/screens/driver/trip_history.dart';
import 'package:cartvorie/screens/driver/message.dart';
import 'package:cartvorie/screens/driver/review.dart';
import 'package:cartvorie/screens/driver/wallet.dart';
import 'package:cartvorie/screens/driver/settings.dart';
import 'package:cartvorie/screens/driver/request_details.dart';
import 'package:cartvorie/screens/driver/contact_admin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:cartvorie/screens/driver/search_page.dart';
import 'package:cartvorie/screens/driver/profile.dart';

class DriverHomePage extends StatefulWidget {
  @override
  _DriverHomePageState createState() => _DriverHomePageState();
}

class _DriverHomePageState extends State<DriverHomePage>
    with SingleTickerProviderStateMixin {
  List<String> _locations = [
    'Navigate to store',
    'Arrived store',
    'Done shopping',
    'Transit to delivery',
    'Delivered',
    'Closed'
  ]; // Option 2
  String _selectedLocation;
  bool isSwitched = false;
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  PageController pageController;
  int _page = 0;
  double labelFontSize = 10;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
    _tabController = new TabController(length: 2, vsync: this);
  }

  TabController _tabController;

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: Drawer(
          child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              Image.asset('assets/images/logo_dark.png', height: 120),
            ]),
            ListTile(
              title: Text('Delivery Request',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  )),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => DeliveryRequest()));
              },
            ),
            ListTile(
              title: Text('Trip History',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  )),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => TripHistory()));
              },
            ),
            ListTile(
              title: Text('Message',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  )),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => Message()));
              },
            ),
            ListTile(
              title: Text('Reviews & Feedback',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  )),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => Reviews()));
              },
            ),
            ListTile(
              title: Text('Wallet',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  )),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => Wallet()));
              },
            ),
            ListTile(
              title: Text('Settings',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  )),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => Settings()));
              },
            ),
            ListTile(
              title: Text('Contact Admin',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  )),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => ContactAdmin()));
              },
            ),
            ListTile(
              title: Text('Logout',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  )),
              onTap: () {
                // Navigator.of(context)
                //  .push(MaterialPageRoute(builder: (_) => Profile()));
              },
            ),
          ])),
      body: TabBarView(controller: _tabController, children: [
        SingleChildScrollView(
            child: Column(children: <Widget>[
          customAppBar(),
          profileBar(),
          SizedBox(height: 15),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => DeliveryRequest()));
                        },
                        child: mediumCard('100', 'Total Trip')),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => Wallet()));
                        },
                        child: mediumCard('\$1000', 'Net Balance'))
                  ]))),
          SizedBox(height: 15),
          mapBox()
        ])),
        Profile(),
      ]),
      bottomNavigationBar: TabBar(
        indicatorColor: UniversalVariables.gradientColorEnd,
        controller: _tabController,
        unselectedLabelColor: Colors.grey,
        labelColor: UniversalVariables.gradientColorEnd,
        tabs: [
          new Tab(icon: Icon(Icons.home)),
          new Tab(
            icon: new Icon(Icons.person),
          ),
        ],
      ),
    ));
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

  Widget mediumCard(String number, String text) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        height: 150,
        width: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: UniversalVariables.fabGradient),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(number,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            Text(text,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white))
          ],
        ));
  }

  Widget mapBox() {
    return Container(
      height: 350,
      alignment: Alignment.centerRight,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/map_cut.jpeg'),
              fit: BoxFit.cover)),
      child: dataBox(),
    );
  }

  Widget dataBox() {
    return Container(
        height: 350,
        width: MediaQuery.of(context).size.width * 0.60,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5.0, // soften the shadow
              spreadRadius: 0.5, //extend the shadow
              offset: Offset(
                0.0, // Move to right 10  horizontally
                0.0, // Move to bottom 10 Vertically
              ),
            )
          ],
        ),
        child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 22),
            children: <Widget>[
              Text('New Orders Alert',
                  style: TextStyle(
                    color: UniversalVariables.gradientColorEnd,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  )),
              Divider(color: UniversalVariables.gradientColorStart),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text('Buyer ID:',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 12)),
                        SizedBox(width: 5),
                        Text('Ose',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: UniversalVariables.gradientColorEnd))
                      ],
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => RequestDetails()));
                        },
                        child: smallBtn('Details'))
                  ]),
              SizedBox(height: 7),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.location_on),
                        SizedBox(width: 5),
                        Text('No 5, Aminu Kano, \nWuse II',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: UniversalVariables.gradientColorEnd))
                      ],
                    ),
                    smallBtn('Reject')
                  ]),
              SizedBox(height: 7),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text('Store:',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            )),
                        SizedBox(width: 5),
                        Text('Oba Market',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: UniversalVariables.gradientColorEnd))
                      ],
                    ),
                    smallBtn('Accept')
                  ]),
              SizedBox(height: 7),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('\$170',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 12)),
                    dropDownBtn()
                  ]),
              SizedBox(height: 7),
              Divider(),
              SizedBox(height: 7),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text('Buyer ID:',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            )),
                        SizedBox(width: 5),
                        Text('Ose',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: UniversalVariables.gradientColorEnd))
                      ],
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => RequestDetails()));
                        },
                        child: smallBtn('Details'))
                  ]),
              SizedBox(height: 7),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.location_on),
                        SizedBox(width: 5),
                        Text('No 5, Aminu Kano, \nWuse II',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: UniversalVariables.gradientColorEnd))
                      ],
                    ),
                    smallBtn('Reject')
                  ]),
              SizedBox(height: 7),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text('Store:',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            )),
                        SizedBox(width: 5),
                        Text('Oba Market',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: UniversalVariables.gradientColorEnd))
                      ],
                    ),
                    smallBtn('Accept')
                  ]),
              SizedBox(height: 7),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('\$170',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        )),
                    dropDownBtn()
                  ]),
              SizedBox(height: 7),
              Divider(),
              SizedBox(height: 7),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text('Buyer ID:',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            )),
                        SizedBox(width: 5),
                        Text('Ose',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: UniversalVariables.gradientColorEnd))
                      ],
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => RequestDetails()));
                        },
                        child: smallBtn('Details'))
                  ]),
              SizedBox(height: 7),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.location_on),
                        SizedBox(width: 5),
                        Text('No 5, Aminu Kano, \nWuse II',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: UniversalVariables.gradientColorEnd))
                      ],
                    ),
                    smallBtn('Reject')
                  ]),
              SizedBox(height: 7),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text('Store:',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            )),
                        SizedBox(width: 5),
                        Text('Oba Market',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: UniversalVariables.gradientColorEnd))
                      ],
                    ),
                    smallBtn('Accept')
                  ]),
              SizedBox(height: 7),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('\$170',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        )),
                    dropDownBtn()
                  ]),
            ]));
  }

  Widget smallBtn(String text) {
    return Container(
        height: 25,
        width: 60,
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: UniversalVariables.fabGradient),
        child: Center(
            child: Text(text,
                style: TextStyle(color: Colors.white, fontSize: 12))));
  }

  Widget dropDownBtn() {
    return Container(
        height: 25,
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
          style: TextStyle(color: Colors.white, fontSize: 12),
          hint: Text('Status',
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
                  style: TextStyle(color: Colors.grey[400], fontSize: 12)),
              value: location,
            );
          }).toList(),
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
                          icon: Icon(Icons.menu, color: Colors.black),
                          onPressed: () {
                            _scaffoldKey.currentState.openDrawer();
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

  Widget profileBar() {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5.0, // soften the shadow
              spreadRadius: 0.5, //extend the shadow
              offset: Offset(
                0.0, // Move to right 10  horizontally
                0.0, // Move to bottom 10 Vertically
              ),
            )
          ],
        ),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(children: <Widget>[
                  Text('Driver ID:',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      )),
                  SizedBox(width: 5),
                  Text('Ose',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: UniversalVariables.gradientColorEnd)),
                ]),
                Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                            print(isSwitched);
                          });
                        },
                        activeTrackColor: UniversalVariables.gradientColorStart,
                        activeColor: UniversalVariables.gradientColorEnd,
                      ),
                      Text('Online status',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: UniversalVariables.gradientColorEnd)),
                    ]),
              ],
            ),
            subtitle: Row(
              children: <Widget>[
                Icon(Icons.location_on),
                SizedBox(width: 3),
                Text('Canada',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: UniversalVariables.gradientColorEnd))
              ],
            ),
            trailing: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => Profile()));
              },
              child: ClipOval(
                child: Image.asset(
                  'assets/images/sophia.jpg',
                  height: 60,
                ),
              ),
            )));
  }
}
