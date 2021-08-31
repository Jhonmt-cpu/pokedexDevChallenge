import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_dev_challenge/pages/home/bloc/home_bloc/home_bloc.dart';
import 'package:pokedex_dev_challenge/pages/home/bloc/input_bloc/input_bloc.dart';
import 'package:pokedex_dev_challenge/pages/home/bloc/sliding_sheet/sliding_sheet_bloc.dart';
import 'package:pokedex_dev_challenge/pages/home/presentation/home_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0x00010000),
    ));
    return MaterialApp(
      title: "Pokedex",
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeBloc()
              ..add(
                FetchHomeListEvent(),
              ),
          ),
          BlocProvider(
            create: (context) => InputBloc(),
          ),
          BlocProvider(
            create: (context) => SlidingSheetBloc(),
          ),
        ],
        child: HomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
