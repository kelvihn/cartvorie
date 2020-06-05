import 'package:flutter/material.dart';

class MapAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/map_cut.jpeg'),
                  fit: BoxFit.cover))),
      Positioned(
        top: 55,
        left: 15,
        child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      )
    ]));
  }
}
