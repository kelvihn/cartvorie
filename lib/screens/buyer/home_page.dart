import 'package:cartvorie/screens/buyer/review_order.dart';
import 'package:cartvorie/screens/buyer/search_page.dart';
import 'package:cartvorie/screens/driver/faq_page.dart';
import 'package:cartvorie/screens/pickup.dart';
import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:cartvorie/screens/buyer/points.dart';
import 'package:cartvorie/screens/buyer/profile.dart';
import 'package:cartvorie/screens/buyer/start_tracking.dart';
import 'package:cartvorie/screens/buyer/start_shopping.dart';
import 'package:cartvorie/screens/buyer/buyer_purchase_history.dart';
import 'package:cartvorie/screens/buyer/buyer_message.dart';
import 'package:cartvorie/screens/buyer/contact_admin.dart';
import 'package:cartvorie/screens/buyer/favorite.dart';
import 'package:cartvorie/screens/buyer/start_tracking.dart';
import 'package:cartvorie/screens/buyer/delivery_status.dart';
import 'package:cartvorie/screens/buyer/settings.dart';

class BuyerHomePage extends StatefulWidget {
  @override
  _BuyerHomePageState createState() => _BuyerHomePageState();
}

class _BuyerHomePageState extends State<BuyerHomePage>
    with SingleTickerProviderStateMixin {
  PageController pageController;
  int _page = 0;
  double labelFontSize = 10;
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
    _tabController = new TabController(length: 2, vsync: this);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  var _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      drawer: Drawer(
          child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              Image.asset('assets/images/logo_dark.png', height: 120),
            ]),
            ListTile(
              title: Text('Profile',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  )),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => Profile()));
              },
            ),
            Divider(),
            ListTile(
              title: Text('Purchase History',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  )),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => BuyerPurchaseHistory()));
              },
            ),
            Divider(),
            ListTile(
              title: Text('Start Shopping',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  )),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => GroceryDelivery()));
              },
            ),
            Divider(),
            ListTile(
              title: Text('Message',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  )),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => BuyerMessage()));
              },
            ),
            Divider(),
            ListTile(
              title: Text('Pickup and Delivery',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  )),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => Pickup()));
              },
            ),
            Divider(),
            ListTile(
              title: Text('Points',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  )),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => Points()));
              },
            ),
            Divider(),
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
            Divider(),
            ListTile(
              title: Text('Favorite',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  )),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => Favorite()));
              },
            ),
            Divider(),
            ExpansionTile(
              title: Text('Delivery Status',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => StartTracking()));
                        },
                        child: Text('Live Tracking')),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => DeliveryStatus()));
                        },
                        child: Text('Goods Delivery Status')),
                  ],
                ),
              ],
            ),
            Divider(),
            ListTile(
              title: Text('FAQ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  )),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => Faq()));
              },
            ),
            Divider(),
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
            Divider(),
            ListTile(
              title: Text('Logout',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  )),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => BuyerMessage()));
              },
            ),
            Divider(),
          ])),
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
      body: TabBarView(
        controller: _tabController,
        children: [
          SingleChildScrollView(
              child: Column(children: <Widget>[
            customAppBar(),
            SizedBox(height: 15),
            profileBar(),
            SizedBox(height: 15),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                      mediumCard('50', 'Total Order'),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => Points()));
                          },
                          child: mediumCard('400', 'Points'))
                    ]))),
            SizedBox(height: 15),
            bigCard(),
            SizedBox(height: 15),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('TRACK YOUR DELIVERY',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18)),
                      SizedBox(height: 10),
                      buildTextInput('Enter delivery ID to track delivery'),
                    ])),
            SizedBox(height: 15),
            GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => StartTracking()));
                },
                child: largeBtn('Start Tracking'))
          ])),
          Profile()
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
            children: <Widget>[
              Text('Buyer ID:',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  )),
              SizedBox(width: 10),
              Text('Ose214',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: UniversalVariables.gradientColorEnd))
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
              )),
        ));
  }

  Widget buildTextInput(String hintText) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
      // margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          border:
              Border.all(color: UniversalVariables.gradientColorEnd, width: 1),
          borderRadius: BorderRadius.circular(5)),
      child: Center(
          child: TextField(
        decoration: InputDecoration.collapsed(hintText: hintText),
      )),
    );
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

  Widget bigCard() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        height: 180,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: UniversalVariables.fabGradient),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('1000',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        SizedBox(height: 6),
                        Text('Points Earned',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white))
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('400',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        SizedBox(height: 6),
                        Text('Points Used',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white))
                      ])
                ]),
            Icon(Foundation.graph_pie, size: 120, color: Colors.white)
          ],
        )));
  }
}
