import 'package:flutter/material.dart';
import 'package:cartvorie/utils/universal_variables.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Terms extends StatefulWidget {
  @override
  _TermsState createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headerImage('assets/images/terms_bg.jpg'),
        SizedBox(height: 15),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                Icon(Ionicons.ios_book,
                    color: UniversalVariables.gradientColorEnd),
                SizedBox(width: 10),
                Text('Please read carefully',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                        color: UniversalVariables.gradientColorEnd))
              ],
            )),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            width: MediaQuery.of(context).size.width,
            child: Text(
                'Ye on properly handsome returned throwing am no whatever. In without wishing he of picture no exposed talking minutes. Curiosity continual belonging offending so explained it exquisite. Do remember to followed yourself material mr recurred carriage. High drew west we no or at john. About or given on witty event. Or sociable up material bachelor bringing landlord confined. Busy so many in hung easy find well up. So of exquisite my an explained remainder. Dashwood denoting securing be on perceive my laughing so.')),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            width: MediaQuery.of(context).size.width,
            child: Text(
                'Ye on properly handsome returned throwing am no whatever. In without wishing he of picture no exposed talking minutes. Curiosity continual belonging offending so explained it exquisite. Do remember to followed yourself material mr recurred carriage. High drew west we no or at john. About or given on witty event. Or sociable up material bachelor bringing landlord confined. Busy so many in hung easy find well up. So of exquisite my an explained remainder. Dashwood denoting securing be on perceive my laughing so.')),
      ],
    ))));
  }

  Widget headerImage(String image) {
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
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 220,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: UniversalVariables.gradientColorEnd.withOpacity(.7)),
            child: Text('TERMS AND CONDITIONS',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w700))),
        Positioned(
            left: 10,
            top: 5,
            child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop()))
      ],
    );
  }

  Widget headerBtn(String text) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.all(5),
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: UniversalVariables.fabGradient,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.phone, color: Colors.white),
            SizedBox(width: 10),
            Text(text, style: TextStyle(color: Colors.white, fontSize: 15))
          ],
        )));
  }
}
