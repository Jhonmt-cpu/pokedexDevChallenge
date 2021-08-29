import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_dev_challenge/pages/home/bloc/home_bloc/home_bloc.dart';
import 'package:pokedex_dev_challenge/pages/home/bloc/input_bloc/input_bloc.dart';
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
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeBloc()
              ..add(
                FetchHomeListEvent(generationId: 1),
              ),
          ),
          BlocProvider(
            create: (context) => InputBloc(),
          ),
        ],
        child: HomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
