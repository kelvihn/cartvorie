import 'package:cartvorie/screens/market_item_single.dart';
import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MarketItemPage extends StatefulWidget {
  @override
  _MarketItemPageState createState() => _MarketItemPageState();
}

class _MarketItemPageState extends State<MarketItemPage> {
  List<String> _locations = ['Price', 'Size', 'Color']; // Option 2
  String _selectedLocation;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Column(
      children: <Widget>[
        header(),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[filterBox()],
            ))),
        Container(
            width: MediaQuery.of(context).size.width,
            child: Center(
                child: GridView.count(
              physics: ScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              crossAxisCount: 2,
              children: <Widget>[
                indomieItemBox('assets/images/soup1.jpg', 'Indomie Noodles'),
                indomieItemBox('assets/images/soup2.jpg', 'Wheat Flour'),
                indomieItemBox('assets/images/soup3.jpg', 'Semovita'),
                indomieItemBox('assets/images/soup4.jpg', 'Spaghetti'),
                indomieItemBox('assets/images/soup1.jpg', 'Indomie Noodles'),
                indomieItemBox('assets/images/soup2.jpg', 'Wheat Flour'),
                indomieItemBox('assets/images/soup3.jpg', 'Semovita'),
                indomieItemBox('assets/images/soup4.jpg', 'Spaghetti'),
              ],
            ))),
      ],
    ))));
  }

  Widget header() {
    return Stack(children: <Widget>[
      Container(
          height: 170,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/others.jpg'),
                  fit: BoxFit.cover))),
      Container(
        height: 170,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: UniversalVariables.gradientColorEnd.withOpacity(.6)),
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Soup Ingredients',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
            SizedBox(height: 20),
            searchBox()
          ],
        )),
      ),
      Positioned(
          left: 10,
          top: 10,
          child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () => Navigator.of(context).pop()))
    ]);
  }

  Widget filterBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      // margin: EdgeInsets.only(left: 20),
      alignment: Alignment.centerRight,
      height: 40,
      width: 140,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 5.0, // soften the shadow
          spreadRadius: 0.5, //extend the shadow
          offset: Offset(
            0.0, // Move to right 10  horizontally
            0.0, // Move to bottom 10 Vertically
          ),
        )
      ], color: Colors.white, borderRadius: BorderRadius.circular(5.0)),
      child: DropdownButton(
        itemHeight: 50,
        underline: SizedBox.shrink(),
        isExpanded: true,
        icon: Icon(Icons.filter_list),
        hint: Text('Filter By'), // Not necessary for Option 1
        value: _selectedLocation,
        onChanged: (newValue) {
          setState(() {
            _selectedLocation = newValue;
          });
        },
        items: _locations.map((location) {
          return DropdownMenuItem(
            child: new Text(location),
            value: location,
          );
        }).toList(),
      ),
    );
  }

  Widget searchBox() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        height: 40,
        width: MediaQuery.of(context).size.width * 0.75,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Colors.white),
        child: Center(
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              Text('Search Products',
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 17,
                      fontWeight: FontWeight.w600)),
              Icon(Icons.search)
            ])));
  }

  Widget indomieItemBox(String image, String name) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => MarketItemSingle(image: image, name: name)));
        },
        child: Container(
            child: Stack(children: <Widget>[
          Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
              margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(5)),
              width: 170,
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
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600)))),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
        ])));
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
}
