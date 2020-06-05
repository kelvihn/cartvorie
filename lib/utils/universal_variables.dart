import 'package:flutter/material.dart';

class UniversalVariables {
  static final Color blueColor = Color(0xff2b9ed4);
  static final Color blackColor = Color(0xff19191b);
  static final Color greyColor = Color(0xff8f8f8f);
  static final Color userCircleBackground = Color(0xff2b2b33);
  static final Color onlineDotColor = Color(0xff46dc64);
  static final Color lightBlueColor = Color(0xff0077d7);
  static final Color separatorColor = Color(0xff272c35);

  static final Color gradientColorStart = Color(0xFFCD11FD);
  static final Color gradientColorEnd = Color(0xFF810EE3);

  static final Color senderColor = Color(0xff2b343b);
  static final Color receiverColor = Color(0xff1e2225);

  static final Gradient fabGradient = LinearGradient(
      colors: [gradientColorStart, gradientColorEnd],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);

  static final Gradient overlayGradient = LinearGradient(colors: [
    gradientColorStart.withOpacity(.35),
    gradientColorEnd.withOpacity(.35)
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);

  static final Gradient paymentOverlayGradient = LinearGradient(colors: [
    Colors.blue[900].withOpacity(.8),
    Colors.blue[900].withOpacity(.8)
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);
}
