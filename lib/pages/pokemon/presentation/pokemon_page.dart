import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex_dev_challenge/core/core.dart';
import 'package:pokedex_dev_challenge/pages/pokemon/bloc/bloc/pokemon_tab_bloc.dart';
import 'package:pokedex_dev_challenge/pages/pokemon/bloc/pokemon_page/pokemon_page_bloc.dart';
import 'package:pokedex_dev_challenge/pages/pokemon/domain/pokemon_page_args.dart';
import 'package:pokedex_dev_challenge/pages/pokemon/presentation/widgets/pokemon_tab_item.dart';
import 'package:pokedex_dev_challenge/pages/pokemon/presentation/widgets/sliding_sheet_tabs/about_tab.dart';
import 'package:pokedex_dev_challenge/pages/pokemon/presentation/widgets/sliding_sheet_tabs/evolution_tab.dart';
import 'package:pokedex_dev_challenge/pages/pokemon/presentation/widgets/sliding_sheet_tabs/stats_tab.dart';
import 'package:pokedex_dev_challenge/pages/pokemon/presentation/widgets/sliding_sheet_tabs/widgets/badge_pokemon_page.dart';
import 'package:pokedex_dev_challenge/pages/pokemon/presentation/widgets/pokemon_page_item.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class PokemonPage extends StatelessWidget {
  PokemonPage({
    Key? key,
  }) : super(key: key);

  static const routeName = '/pokemon_page';

  @override
  Widget build(BuildContext context) {
    final PokemonPageBloc pokemonPageBloc =
        BlocProvider.of<PokemonPageBloc>(context);

    final PokemonTabBloc pokemonTabBloc =
        BlocProvider.of<PokemonTabBloc>(context);

    final args = ModalRoute.of(context)!.settings.arguments as PokemonPageArgs;

    final String pokemonName = args.pokemon.name.toUpperCase();

    final String pokemonNameLower = args.pokemon.name;

    final String nameWithFirstUpperCase =
        pokemonNameLower[0].toUpperCase() + pokemonNameLower.substring(1);

    final Color backgroundColor = _defineBackgroundTypeColor(args.pokemon
        .pokemonV2Pokemons[0].pokemonV2Pokemontypes[0].pokemonV2Type.name);

    final double screenSize = MediaQuery.of(context).size.width;

    final double screenHeight = MediaQuery.of(context).size.height;

    final double menuPadding = MediaQuery.of(context).padding.bottom;

    final Size pokemonBackNameSize =
        _textSize(pokemonName, AppTextStyles.title);

    final Size pokemonNameSize =
        _textSize(nameWithFirstUpperCase, AppTextStyles.pokemonPageName);

    final double containerBackNamePadding =
        (screenSize - pokemonBackNameSize.width) / 2;

    final double containerNamePadding =
        (screenSize - pokemonNameSize.width) / 2;

    final List<Widget> tabConfig = [
      AboutTab(),
      StatsTab(),
      EvolutionTab(),
    ];

    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<PokemonPageBloc, PokemonPageState>(
        bloc: pokemonPageBloc,
        builder: (context, state) {
          state as PokemonPageLoaded;
          return SlidingSheet(
            listener: (state) {
              pokemonPageBloc.add(
                SligingSheetScroolPokemonPage(progress: state.progress),
              );
            },
            color: AppColors.backgroundWhite,
            scrollSpec: ScrollSpec(
              physics: BouncingScrollPhysics(),
            ),
            snapSpec: const SnapSpec(
              snap: true,
              snappings: [0.68, 0.85],
              positioning: SnapPositioning.relativeToAvailableSpace,
            ),
            minHeight: (0.85 * screenHeight) -
                30 -
                (menuPadding == 0 ? 50 : menuPadding),
            body: SafeArea(
              child: Container(
                height: 265,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: containerBackNamePadding,
                      child: Opacity(
                        opacity: state.pokemonBackNameOpacity.toDouble(),
                        child: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            final Rect rect = Rect.fromLTRB(
                                0, 0, bounds.width, bounds.height);
                            return AppGradients.pokemonTitleName
                                .createShader(rect);
                          },
                          child: BorderedText(
                            strokeWidth: 2,
                            strokeColor: AppColors.textWhite.withOpacity(0.3),
                            child: Text(
                              pokemonName,
                              style: AppTextStyles.title,
                              maxLines: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0 + state.progress * 150,
                      right: -70,
                      child: GradientIcon(
                        gradient: AppGradients.gradientVectorWhite,
                        icon: AppImages.pattern10x5,
                        size: 140,
                      ),
                    ),
                    Positioned(
                      left: (state.progress * (containerNamePadding - 150)) +
                          (state.reversedProgress * 40),
                      top: 70 - state.progress * 105,
                      child: PokemonPageItem(
                        pokemon: args.pokemon,
                        opacity: state.pokemonItemOpacity.toDouble(),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 40,
                          top: 16,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: SvgPicture.asset(
                            AppImages.back,
                            width: 25,
                            height: 25,
                            color: AppColors.textWhite,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            headerBuilder: (context, state) {
              return BlocBuilder<PokemonTabBloc, PokemonTabState>(
                bloc: pokemonTabBloc,
                builder: (context, state) {
                  state as PokemonTabSelected;
                  return Stack(
                    children: [
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                backgroundColor,
                                AppColors.backgroundWhite,
                              ]),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: backgroundColor,
                        ),
                        height: 75,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 50,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.backgroundWhite,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                          ),
                          height: 30,
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 50,
                            width: screenSize,
                          ),
                          Positioned(
                            top: 0,
                            child: Container(
                              width: screenSize,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      pokemonTabBloc.add(
                                        ChangePokemonTab(tabId: 0),
                                      );
                                    },
                                    child: PokemonTabItem(
                                      text: "About",
                                      isSelected: state.tabIndex == 0,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      pokemonTabBloc.add(
                                        ChangePokemonTab(tabId: 1),
                                      );
                                    },
                                    child: PokemonTabItem(
                                      text: "Stats",
                                      isSelected: state.tabIndex == 1,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      pokemonTabBloc.add(
                                        ChangePokemonTab(tabId: 2),
                                      );
                                    },
                                    child: PokemonTabItem(
                                      text: "Evoulution",
                                      isSelected: state.tabIndex == 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              );
            },
            builder: (context, state) {
              return BlocBuilder<PokemonTabBloc, PokemonTabState>(
                bloc: pokemonTabBloc,
                builder: (context, state) {
                  state as PokemonTabSelected;
                  return Padding(
                    padding: EdgeInsets.only(
                      right: 30,
                      left: 30,
                      bottom: menuPadding == 0 ? 50 : menuPadding,
                    ),
                    child: tabConfig[state.tabIndex],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

Size _textSize(String text, TextStyle style) {
  final TextPainter textPainter = TextPainter(
    text: TextSpan(text: text, style: style),
    maxLines: 1,
    textDirection: TextDirection.ltr,
  )..layout(minWidth: 0, maxWidth: double.infinity);
  return textPainter.size;
}

Color _defineBackgroundTypeColor(String type) {
  final config = {
    "grass": AppColors.backgroundTypeGrass,
    "poison": AppColors.backgroundTypePoison,
    "bug": AppColors.backgroundTypeBug,
    "dark": AppColors.backgroundTypeDark,
    "dragon": AppColors.backgroundTypeDragon,
    "electric": AppColors.backgroundTypeElectric,
    "fairy": AppColors.backgroundTypeFairy,
    "fighting": AppColors.backgroundTypeFighting,
    "fire": AppColors.backgroundTypeFire,
    "flying": AppColors.backgroundTypeFlying,
    "ghost": AppColors.backgroundTypeGhost,
    "ground": AppColors.backgroundTypeGround,
    "ice": AppColors.backgroundTypeIce,
    "normal": AppColors.backgroundTypeNormal,
    "psychic": AppColors.backgroundTypePsychic,
    "rock": AppColors.backgroundTypeRock,
    "steel": AppColors.backgroundTypeSteel,
    "water": AppColors.backgroundTypeWater,
  };

  return config[type] as Color;
}
