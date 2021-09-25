import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_dev_challenge/core/widgets/dismiss_keyboard.dart';
import 'package:pokedex_dev_challenge/pages/home/bloc/filter_tab/filter_tab_bloc.dart';
import 'package:pokedex_dev_challenge/pages/home/bloc/generation_tab/generation_tab_bloc.dart';
import 'package:pokedex_dev_challenge/pages/home/bloc/home_bloc/home_bloc.dart';
import 'package:pokedex_dev_challenge/pages/home/bloc/input_bloc/input_bloc.dart';
import 'package:pokedex_dev_challenge/pages/home/bloc/sliding_sheet/sliding_sheet_bloc.dart';
import 'package:pokedex_dev_challenge/pages/home/bloc/sort_tab/sort_tab_bloc.dart';
import 'package:pokedex_dev_challenge/pages/home/presentation/home_page.dart';
import 'package:pokedex_dev_challenge/pages/pokemon/bloc/pokemon_page/pokemon_page_bloc.dart';
import 'package:pokedex_dev_challenge/pages/pokemon/presentation/pokemon_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FilterTabBloc filterTabBloc = FilterTabBloc();
    return DismissKeyboard(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeBloc(filterTabBloc)
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
          BlocProvider(
            create: (context) => GenerationTabBloc(),
          ),
          BlocProvider(
            create: (context) => SortTabBloc(),
          ),
          BlocProvider(
            create: (context) => filterTabBloc,
          ),
          BlocProvider(
            create: (context) => PokemonPageBloc(),
          ),
        ],
        child: MaterialApp(
          title: "Pokedex",
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            HomePage.routeName: (context) => HomePage(),
            PokemonPage.routeName: (context) => PokemonPage(),
          },
        ),
      ),
    );
  }
}
