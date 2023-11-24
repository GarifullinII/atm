import 'package:flutter/material.dart';

class ColorConstants {
  static Color labelColor = const Color(0xFFFFFFFF);
  static Color pinkColor = const Color(0xFFE61EAD);
  static Color greyColor = const Color(0xFFA3A2AC);
  static Color blueColor = const Color(0xFF3827B4);
  static Color dividerColor = const Color.fromRGBO(56, 39, 180, 0.06);
  static Color shadowTopBarColor = const Color(0xFF616161);
  static LinearGradient backgroundColor = const LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF3827B4), // Start color
      Color(0xFF6C18A4), // End color
    ],
  );
}
