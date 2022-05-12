import 'package:flutter/material.dart';

class AppGradients {
  static const gradientVector = LinearGradient(
    colors: [
      Color.fromRGBO(255, 255, 255, 0.3),
      Color.fromRGBO(255, 255, 255, 0),
    ],
    stops: [0, 0.75],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const gradientPokeball = LinearGradient(
    colors: [
      Color(0xFFF5F5F5),
      Color(0xFFFFFFFF),
    ],
    stops: [0.3, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const gradientVectorWhite = LinearGradient(
    colors: [
      Color.fromRGBO(255, 255, 255, 0.3),
      Color.fromRGBO(255, 255, 255, 0),
    ],
    stops: [0, 1],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const gradientPokeballWhite = LinearGradient(
    colors: [
      Color.fromRGBO(255, 255, 255, 0.1),
      Color.fromRGBO(255, 255, 255, 0),
    ],
    stops: [0.7, 0.9],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const gradientVectorGrey = LinearGradient(
    colors: [
      Color.fromRGBO(229, 229, 229, 1),
      Color.fromRGBO(245, 245, 245, 0),
    ],
    stops: [0.4, 0.9],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const gradientPokeballGrey = LinearGradient(
    colors: [
      Color.fromRGBO(236, 236, 236, 1),
      Color.fromRGBO(245, 245, 245, 1),
    ],
    stops: [0.7, 0.9],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const pokemonTitleName = LinearGradient(
    colors: [
      Color.fromRGBO(255, 255, 255, 0.3),
      Color.fromRGBO(255, 255, 255, 0),
    ],
    stops: [0.55, 0.75],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const pokemonCircle = LinearGradient(
    colors: [
      Color.fromRGBO(255, 255, 255, 0),
      Color.fromRGBO(255, 255, 255, 0.35),
    ],
    stops: [0.7, 0.9],
    begin: Alignment.topLeft,
    end: Alignment.bottomCenter,
  );
}
