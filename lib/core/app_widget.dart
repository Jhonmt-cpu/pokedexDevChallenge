import 'package:flutter/material.dart';
import 'package:pokedex_dev_challenge/pages/home/presentation/home_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DevQuiz",
      home: HomePage(),
    );
  }
}
