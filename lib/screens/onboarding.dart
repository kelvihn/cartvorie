import 'package:flutter/material.dart';
import 'package:cartvorie/screens/home_page.dart';
import 'package:cartvorie/screens/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../repository/user_repository.dart' as repository;
import 'package:cartvorie/screens/buyer/home_page.dart';
import 'package:cartvorie/screens/driver/home_page.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  _navigate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final user = prefs.getString('current_user');
    if (user == null) {
      return null;
    } else {
      if (repository.currentUser.value.accountType == 'buyer') {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => BuyerHomePage()),
          (Route<dynamic> route) => false,
        );
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => DriverHomePage()),
          (Route<dynamic> route) => false,
        );
      }
    }
  }

  @override
  void initState() {
    _navigate();
    super.initState();
  }

  final PageController _pageController = PageController(initialPage: 0);
  final int numPage = 3;
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
            physics: ClampingScrollPhysics(),
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: <Widget>[
          Container(
              child: Stack(children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/slider1.jpg'),
                        fit: BoxFit.cover))),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                      Color(0xFF7114C3).withOpacity(.6),
                      Color(0xFF7114C3).withOpacity(.6),
                      Color(0xFF7114C3).withOpacity(.6),
                      Color(0xFF7114C3).withOpacity(.6),
                    ])),
                child: Center(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Image.asset('assets/images/logo.png',
                                  height: 120),
                              FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) => LoginPage()));
                                  },
                                  child: Text('Login',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 16)))
                            ])),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        child: Center(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                              Text('Welcome to Cartvorie',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24)),
                              SizedBox(height: 30),
                              Text(
                                  'We make your online grocery shopping and delivery a seamless effort. You can use our app to order from your favorite stores and have them delivered to your doorstep. All stores are verified.',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                  textAlign: TextAlign.center)
                            ]))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildPageIndicator(),
                    ),
                    _currentPage != numPage - 1
                        ? FlatButton(
                            onPressed: () {
                              _pageController.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease);
                            },
                            child: nextContainer())
                        : Text(''),
                    _currentPage == numPage - 1
                        ? FlatButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => HomePage()));
                            },
                            child: Text('Get Started',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)))
                        : Text('')
                  ],
                ))),
          ])),
          //////////////////////////////////////////////////
          /////////////////////////////////////////////////
          Container(
              child: Stack(children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/slider2.jpg'),
                        fit: BoxFit.cover))),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                      Color(0xFF7114C3).withOpacity(.6),
                      Color(0xFF7114C3).withOpacity(.6),
                      Color(0xFF7114C3).withOpacity(.6),
                      Color(0xFF7114C3).withOpacity(.6),
                    ])),
                child: Center(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Image.asset('assets/images/logo.png',
                                  height: 120),
                              FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) => LoginPage()));
                                  },
                                  child: Text('Login',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 16)))
                            ])),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        child: Center(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                              Text('Quick Pickup & Delivery',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24)),
                              SizedBox(height: 30),
                              Text(
                                  'You have an item to be picked up fast? Yes, we can also help with your pickup and delivery.',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                  textAlign: TextAlign.center)
                            ]))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildPageIndicator(),
                    ),
                    _currentPage != numPage - 1
                        ? FlatButton(
                            onPressed: () {
                              _pageController.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease);
                            },
                            child: nextContainer())
                        : Text(''),
                    _currentPage == numPage - 1
                        ? FlatButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => HomePage()));
                            },
                            child: Text('Get Started',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)))
                        : Text('')
                  ],
                ))),
          ])),
          ///////////////////////////////////////////////////////////////////////////
          //////////////////////////////////////////////////////////////////////
          Container(
              child: Stack(children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/slider3.jpg'),
                        fit: BoxFit.cover))),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                      Color(0xFF7114C3).withOpacity(.6),
                      Color(0xFF7114C3).withOpacity(.6),
                      Color(0xFF7114C3).withOpacity(.6),
                      Color(0xFF7114C3).withOpacity(.6),
                    ])),
                child: Center(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Image.asset('assets/images/logo.png',
                                  height: 120),
                              FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) => LoginPage()));
                                  },
                                  child: Text('Login',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 16)))
                            ])),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        child: Center(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                              Text('Our Delivery Partners',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24)),
                              SizedBox(height: 30),
                              Text(
                                  'Become a delivery partner by helping in grocery pickup and delivery to make extra income.',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                  textAlign: TextAlign.center)
                            ]))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildPageIndicator(),
                    ),
                    _currentPage != numPage - 1
                        ? FlatButton(
                            onPressed: () {
                              _pageController.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease);
                            },
                            child: nextContainer())
                        : Text(''),
                    _currentPage == numPage - 1
                        ? FlatButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => HomePage()));
                            },
                            child: Text('Get Started',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)))
                        : Text('')
                  ],
                ))),
          ])),
        ]));
  }

  Widget nextContainer() {
    return Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        child: Center(
            child: Icon(Icons.arrow_forward_ios, color: Color(0xFF8A0EE6))));
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < numPage; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Color(0xFF9DADFD),
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
    );
  }
}
