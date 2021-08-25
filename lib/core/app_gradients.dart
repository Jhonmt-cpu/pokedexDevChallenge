import 'dart:math';

import 'package:flutter/material.dart';

class AppGradients {
  static final gradientVector = LinearGradient(
    colors: [
      Color.fromRGBO(255, 255, 255, 0.3),
      Color.fromRGBO(255, 255, 255, 0),
    ],
    stops: [0.0, 0.695],
    transform: GradientRotation(2.13959913 * pi),
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
}
