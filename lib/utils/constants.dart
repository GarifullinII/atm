import 'package:flutter/material.dart';

class ColorConstants {
  static Color labelColor = const Color(0xFFFFFFFF);
  static Color pinkColor = const Color(0xFFE61EAD);
  static Color greyColor = const Color(0xFFA3A2AC);
  static Color greyOpacityColor = const Color(0xFFA3A2AC).withOpacity(0.2);
  static Color blueColor = const Color(0xFF3827B4);
  static Color dividerColor = const Color.fromRGBO(56, 39, 180, 0.06);
  static Color shadowTopBarColor = const Color(0xFF616161);

  static LinearGradient circuitColor = const LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF3827B4),
      Color(0xFF6C18A4),
    ],
    stops: [0.0, 1.0],
  );

  static LinearGradient circuitFirstColor = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.bottomRight,
    colors: [
      const Color(0xFF3827B4).withOpacity(0.7),
      const Color(0xFF6C18A4).withOpacity(0.7),
    ],
  stops: const [0.0, 0.824],
  );

  static LinearGradient circuitSecondColor = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.bottomRight,
    colors: [
      const Color(0xFF3827B4).withOpacity(0.7),
      const Color(0xFF6C18A4).withOpacity(0.7),
    ],
    stops: const [0.0, 1.0],
  );

  static LinearGradient circuitThirdColor = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.bottomRight,
    colors: [
      const Color(0xFF3827B4).withOpacity(0.4),
      const Color(0xFF6C18A4).withOpacity(0.4),
    ],
    stops: const [0.0, 1.0],
  );

  static LinearGradient circuitFourthColor = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.bottomRight,
    colors: [
      const Color(0xFF3827B4).withOpacity(0.2),
      const Color(0xFF6C18A4).withOpacity(0.2),
    ],
    stops: const [0.0, 1.0],
  );
}
