import 'package:flutter/material.dart';

class AppGradients {
  static final gradientVector = LinearGradient(
    colors: [
      Color.fromRGBO(255, 255, 255, 0.3),
      Color.fromRGBO(255, 255, 255, 0),
    ],
    stops: [0, 0.75],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static final gradientPokeball = LinearGradient(
    colors: [
      Color(0xFFF5F5F5),
      Color(0xFFFFFFFF),
    ],
    stops: [0.3, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static final gradientVectorWhite = LinearGradient(
    colors: [
      Color.fromRGBO(255, 255, 255, 0.1),
      Color.fromRGBO(255, 255, 255, 0),
    ],
    stops: [0.4, 0.9],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static final gradientPokeballWhite = LinearGradient(
    colors: [
      Color.fromRGBO(255, 255, 255, 0.1),
      Color.fromRGBO(255, 255, 255, 0),
    ],
    stops: [0.7, 0.9],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static final gradientVectorGrey = LinearGradient(
    colors: [
      Color.fromRGBO(229, 229, 229, 1),
      Color.fromRGBO(245, 245, 245, 0),
    ],
    stops: [0.4, 0.9],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static final gradientPokeballGrey = LinearGradient(
    colors: [
      Color.fromRGBO(236, 236, 236, 1),
      Color.fromRGBO(245, 245, 245, 1),
    ],
    stops: [0.7, 0.9],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
