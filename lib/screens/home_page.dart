import 'package:cartvorie/screens/about_us.dart';
import 'package:cartvorie/screens/buyer/review_order.dart';
import 'package:cartvorie/screens/contact_us.dart';
import 'package:cartvorie/screens/driver/search_page.dart';
import 'package:cartvorie/screens/main_store.dart';
import 'package:cartvorie/screens/policy_settings.dart';
import 'package:cartvorie/screens/terms.dart';
import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:cartvorie/screens/grocery_delivery.dart';
import 'package:cartvorie/screens/pickup.dart';
import 'package:cartvorie/screens/african_stores.dart';
import 'package:cartvorie/screens/international_stores.dart';
import 'package:cartvorie/screens/main_market.dart';
import 'package:cartvorie/screens/other_stores.dart';
import 'package:cartvorie/screens/food_category.dart';
import 'package:cartvorie/screens/prepared_meals_category.dart';
import 'package:cartvorie/screens/toiletries_category.dart';
import 'package:cartvorie/screens/fruits_category.dart';
import 'package:cartvorie/screens/others_category.dart';
import 'package:cartvorie/screens/login_page.dart';
import 'package:cartvorie/screens/registration.dart';
import 'package:cartvorie/screens/all_products.dart';
import 'package:cartvorie/screens/track_delivery.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
            drawer: Drawer(
                child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                    children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Image.asset('assets/images/logo_dark.png', height: 120),
                      ]),
                  ListTile(
                    title: Text('Grocery Delivery',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        )),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => GroceryDelivery()));
                    },
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Pickup & Delivery',
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
                  ExpansionTile(
                    title: Text('Stores',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        )),
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          FlatButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => AfricanStores()));
                              },
                              child: Text('African')),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          FlatButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => InternationalStores()));
                              },
                              child: Text('International')),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          FlatButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => MainMarket()));
                              },
                              child: Text('Main Market')),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          FlatButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => OtherStores()));
                              },
                              child: Text('Others')),
                        ],
                      ),
                    ],
                  ),
                  Divider(),
                  ExpansionTile(
                    title: Text('Categories',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        )),
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          FlatButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => FoodCategory()));
                              },
                              child: Text('Food')),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          FlatButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => PreparedMealsCategory()));
                              },
                              child: Text('Prepared Meals')),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          FlatButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => ToiletriesCategory()));
                              },
                              child: Text('Toiletries')),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          FlatButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => FruitsCategory()));
                              },
                              child: Text('Fruits')),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          FlatButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => OthersCategory()));
                              },
                              child: Text('Others')),
                        ],
                      ),
                    ],
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Products',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        )),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => AllProducts()));
                    },
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Login',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        )),
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => LoginPage()));
                    },
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Register',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        )),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => Registration()));
                    },
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Track Your Delivery',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        )),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => TrackDelivery()));
                    },
                  ),
                  Divider(),
                ])),
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                customAppBar(),
                Container(
                    height: 50,
                    child: ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => GroceryDelivery()));
                          },
                          child: headerBtn('Grocery Delivery'),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (_) => Pickup()));
                            },
                            child: headerBtn('Pickup & Delivery')),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => GroceryDelivery()));
                            },
                            child: headerBtn('Stores')),
                      ],
                    )),
                SizedBox(height: 20),
                Container(
                  height: 250,
                  child: PageView(
                    children: <Widget>[
                      headerImage('assets/images/shop_bg4.jpg',
                          'Fresh Farm \nGroceries'),
                      headerImage('assets/images/shop9.jpg',
                          'Fun Shopping \nExperience'),
                      headerImage(
                          'assets/images/shop10.jpg', 'Top Notch \nProducts')
                    ],
                  ),
                ),
                SizedBox(height: 10),
                nearbyStores(),
                SizedBox(height: 15),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => GroceryDelivery()));
                    },
                    child: headerBtn('View All')),
                SizedBox(height: 25),
                headerImage2(),
                /*
                SizedBox(height: 15),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  alignment: Alignment.centerLeft,
                  child: Text('ALL PRODUCTS',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                          color: Colors.black87)),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                        child: GridView.count(
                      physics: ScrollPhysics(),
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      crossAxisCount: 2,
                      children: <Widget>[
                        indomieItemBox(
                            'assets/images/groc1.jpg', 'Indomie Noodles'),
                        indomieItemBox(
                            'assets/images/groc2.jpg', 'Wheat Flour'),
                        indomieItemBox('assets/images/groc3.jpg', 'Semovita'),
                        indomieItemBox('assets/images/groc4.jpg', 'Spaghetti'),
                        indomieItemBox(
                            'assets/images/groc5.jpg', 'Corn Flakes'),
                        indomieItemBox(
                            'assets/images/groc6.jpg', 'Golden Morn'),
                      ],
                    ))),
                    */
                //    SizedBox(height: 25),
                Container(
                    height: 100,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 17),
                    width: MediaQuery.of(context).size.width,
                    color: UniversalVariables.gradientColorEnd,
                    child: Center(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (_) => AboutUs()));
                                    },
                                    child: Text('About Us',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600))),
                                Text('Refund Policy',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (_) => ContactUs()));
                                    },
                                    child: Text('Contact Us',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600)))
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (_) => Terms()));
                                    },
                                    child: Text('T & C',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600))),
                                Text('Delivery Agents',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                                Row(
                                  children: <Widget>[
                                    Icon(AntDesign.facebook_square,
                                        color: Colors.white),
                                    SizedBox(width: 6),
                                    Icon(AntDesign.twitter,
                                        color: Colors.white),
                                    SizedBox(width: 6),
                                    Icon(FontAwesome.whatsapp,
                                        color: Colors.white)
                                  ],
                                )
                              ])
                        ])))
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (_) => LoginPage()));
                                      },
                                      child:
                                          Icon(Icons.person_outline, size: 30),
                                    ),
                                    Text('Login/Signup',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12))
                                  ],
                                )
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

  Widget indomieItemBox(String image, String name) {
    return Container(
        child: Stack(children: <Widget>[
      Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
          margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          decoration: BoxDecoration(
              color: Colors.grey[50], borderRadius: BorderRadius.circular(5)),
          width: 150,
          height: 220,
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                Image.asset(image, height: 80),
                Container(
                    // width: 180,
                    child: Center(
                        child: Text(name,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600)))),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('\$13',
                          style: TextStyle(
                              color: UniversalVariables.gradientColorEnd,
                              fontWeight: FontWeight.w600)),
                      Row(children: <Widget>[
                        RatingBar(
                          initialRating: 5,
                          itemSize: 12,
                          minRating: 1,
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
                        SizedBox(width: 5),
                        Text('18',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),
                      ])
                    ])
              ]))),
      Positioned(top: 10, left: 1, child: pickerCon())
    ]));
  }

  Widget pickerCon() {
    return Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            gradient: UniversalVariables.fabGradient,
            borderRadius: BorderRadius.circular(25)),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(Icons.arrow_back, size: 14, color: Colors.white),
            Icon(Icons.arrow_forward, size: 14, color: Colors.white),
          ],
        )));
  }

  Widget headerBtn(String text) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        padding: EdgeInsets.all(5),
        height: 40,
        width: 150,
        decoration: BoxDecoration(
            gradient: UniversalVariables.fabGradient,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(text,
                style: TextStyle(color: Colors.white, fontSize: 15))));
  }

  Widget headerImage(String image, String text) {
    return Stack(
      children: <Widget>[
        Container(
          height: 220,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            height: 220,
            width: MediaQuery.of(context).size.width,
            decoration:
                BoxDecoration(gradient: UniversalVariables.overlayGradient),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(text,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold)),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => GroceryDelivery()));
                      },
                      child: shopNowBtn('Shop Now')),
                ]))
      ],
    );
  }

  Widget headerImage2() {
    return Stack(
      children: <Widget>[
        Container(
          height: 220,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/delivery4.jpg'),
                  fit: BoxFit.cover)),
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            height: 220,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.black.withOpacity(.8)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Need Pickup \n& Delivery Serivices?',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                  Text('We can help',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w300)),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => Pickup()));
                      },
                      child: shopNowBtn('Pick-up Request')),
                ]))
      ],
    );
  }

  Widget shopNowBtn(String text) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        padding: EdgeInsets.all(5),
        height: 40,
        width: 150,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.white),
            gradient: UniversalVariables.fabGradient,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(text,
                style: TextStyle(color: Colors.white, fontSize: 12))));
  }

  Widget nearbyStores() {
    return Container(
        margin: EdgeInsets.all(15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Text('STORES NEAR YOU',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  color: Colors.black87)),
          SizedBox(height: 10),
          Container(
              height: 180,
              child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    card(
                        'assets/images/shop_bg2.jpg', 'Omar Stores', '4', '20'),
                    card('assets/images/shop_bg3.jpg',
                        'Best Bargain Supermarket', '6', '15'),
                    card('assets/images/shop_bg1.jpg', 'Omar Stores', '4', '20')
                  ]))
        ]));
  }

  Widget card(String image, String storeName, String distance, String likes) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => MainStore()));
        },
        child: Container(
          padding: EdgeInsets.only(bottom: 4),
          margin: EdgeInsets.all(10),
          height: 50,
          width: 150,
          decoration: BoxDecoration(
              color: Colors.grey[50], borderRadius: BorderRadius.circular(10)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 70,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                      )),
                ),
                Container(
                  width: 180,
                  child: Text(storeName,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      )),
                ),
                Row(children: <Widget>[
                  Icon(MaterialCommunityIcons.map_marker_distance,
                      color: UniversalVariables.gradientColorEnd),
                  SizedBox(width: 5),
                  Text('$distance KM', style: TextStyle(fontSize: 12)),
                  SizedBox(width: 15),
                  Icon(AntDesign.heart,
                      color: UniversalVariables.gradientColorEnd),
                  SizedBox(width: 5),
                  Text('$likes KM', style: TextStyle(fontSize: 12))
                ])
              ]),
        ));
  }
}
