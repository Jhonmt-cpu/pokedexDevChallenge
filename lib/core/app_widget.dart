import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex_dev_challenge/pages/home/presentation/home_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
    );
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    return MaterialApp(
      title: "DevQuiz",
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
