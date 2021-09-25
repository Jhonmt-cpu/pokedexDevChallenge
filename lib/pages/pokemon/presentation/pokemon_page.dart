import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex_dev_challenge/core/core.dart';
import 'package:pokedex_dev_challenge/pages/pokemon/bloc/pokemon_page/pokemon_page_bloc.dart';
import 'package:pokedex_dev_challenge/pages/pokemon/domain/pokemon_page_args.dart';
import 'package:pokedex_dev_challenge/pages/pokemon/presentation/widgets/badge_pokemon_page.dart';
import 'package:pokedex_dev_challenge/pages/pokemon/presentation/widgets/pokemon_page_item.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class PokemonPage extends StatelessWidget {
  PokemonPage({
    Key? key,
  }) : super(key: key);

  static const routeName = '/pokemon_page';

  @override
  Widget build(BuildContext context) {
    PokemonPageBloc pokemonPageBloc = BlocProvider.of<PokemonPageBloc>(context);

    final args = ModalRoute.of(context)!.settings.arguments as PokemonPageArgs;

    String pokemonName = args.pokemon.name.toUpperCase();

    String pokemonNameLower = args.pokemon.name;
    String nameWithFirstUpperCase =
        pokemonNameLower[0].toUpperCase() + pokemonNameLower.substring(1);

    Color backgroundColor = _defineBackgroundTypeColor(args.pokemon
        .pokemonV2Pokemons[0].pokemonV2Pokemontypes[0].pokemonV2Type.name);

    final double screenSize = MediaQuery.of(context).size.width;

    final double screenHeight = MediaQuery.of(context).size.height;

    final double menuPadding = MediaQuery.of(context).padding.bottom;

    final Size pokemonBackNameSize =
        _textSize(pokemonName, AppTextStyles.title);

    final Size pokemonNameSize =
        _textSize(nameWithFirstUpperCase, AppTextStyles.pokemonPageName);

    double containerBackNamePadding =
        (screenSize - pokemonBackNameSize.width) / 2;

    double containerNamePadding = (screenSize - pokemonNameSize.width) / 2;

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
            minHeight: 0.85 * screenHeight,
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                child: Stack(
                                  children: [
                                    GradientIcon(
                                      icon: AppImages.pokeball,
                                      size: 100,
                                      gradient:
                                          AppGradients.gradientVectorWhite,
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          bottom: 49,
                                        ),
                                        child: Text(
                                          "About",
                                          style:
                                              AppTextStyles.pokemonPageTabTitle,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 100,
                                width: 100,
                                child: Stack(
                                  children: [
                                    GradientIcon(
                                      icon: AppImages.pokeball,
                                      size: 100,
                                      gradient:
                                          AppGradients.gradientVectorWhite,
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          bottom: 49,
                                        ),
                                        child: Text(
                                          "Stats",
                                          style:
                                              AppTextStyles.pokemonPageTabTitle,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 100,
                                width: 100,
                                child: Stack(
                                  children: [
                                    GradientIcon(
                                      icon: AppImages.pokeball,
                                      size: 100,
                                      gradient:
                                          AppGradients.gradientVectorWhite,
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          bottom: 49,
                                        ),
                                        child: Text(
                                          "Evolution",
                                          style:
                                              AppTextStyles.pokemonPageTabTitle,
                                        ),
                                      ),
                                    ),
                                  ],
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
            builder: (context, state) {
              // This is the content of the sheet that will get
              // scrolled, if the content is bigger than the available
              // height of the sheet.
              return Padding(
                padding: EdgeInsets.only(
                  right: 30,
                  left: 30,
                  bottom: menuPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun's rays the seed grows progressively larger.",
                      style: AppTextStyles.description,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Pokédex Data",
                      style: TextStyle(
                        fontFamily: 'SfPro',
                        color: AppColors.typeGrass,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          child: Text(
                            "Species",
                            style: AppTextStyles.pokemonStat,
                          ),
                        ),
                        Text(
                          "Seed Pokémon",
                          style: AppTextStyles.description,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          child: Text(
                            "Height",
                            style: AppTextStyles.pokemonStat,
                          ),
                        ),
                        Text(
                          "0.7m",
                          style: AppTextStyles.description,
                        ),
                        Text(
                          "(2'04\")",
                          style: AppTextStyles.pokemonStatValueSmall,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          child: Text(
                            "Weight",
                            style: AppTextStyles.pokemonStat,
                          ),
                        ),
                        Text(
                          "6.9kg",
                          style: AppTextStyles.description,
                        ),
                        Text(
                          "(15.2l bs)",
                          style: AppTextStyles.pokemonStatValueSmall,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          child: Text(
                            "Abilities",
                            style: AppTextStyles.pokemonStat,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "1.Overgrow",
                              style: AppTextStyles.description,
                            ),
                            Text(
                              "Chlorophyll (hidden ability)",
                              style: AppTextStyles.pokemonStatValueSmall,
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          child: Text(
                            "Weaknesses",
                            style: AppTextStyles.pokemonStat,
                          ),
                        ),
                        BadgePokemonPage(
                          type: "fire",
                        ),
                        BadgePokemonPage(
                          type: "flying",
                        ),
                        BadgePokemonPage(
                          type: "ice",
                        ),
                        BadgePokemonPage(
                          type: "psychic",
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Training",
                      style: TextStyle(
                        fontFamily: 'SfPro',
                        color: AppColors.typeGrass,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          child: Text(
                            "EV Yield",
                            style: AppTextStyles.pokemonStat,
                          ),
                        ),
                        Text(
                          "1 Special Attack",
                          style: AppTextStyles.description,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          child: Text(
                            "Catch Rate",
                            style: AppTextStyles.pokemonStat,
                          ),
                        ),
                        Text(
                          "45",
                          style: AppTextStyles.description,
                        ),
                        Text(
                          "(5.9% with PokéBall, full HP)",
                          style: AppTextStyles.pokemonStatValueSmall,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          child: Text(
                            "Base Friendship",
                            style: AppTextStyles.pokemonStat,
                          ),
                        ),
                        Text(
                          "70",
                          style: AppTextStyles.description,
                        ),
                        Text(
                          "(normal)",
                          style: AppTextStyles.pokemonStatValueSmall,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          child: Text(
                            "Base Exp",
                            style: AppTextStyles.pokemonStat,
                          ),
                        ),
                        Text(
                          "64",
                          style: AppTextStyles.description,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          child: Text(
                            "Growth Rate",
                            style: AppTextStyles.pokemonStat,
                          ),
                        ),
                        Text(
                          "Medium Slow",
                          style: AppTextStyles.description,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Breeding",
                      style: TextStyle(
                        fontFamily: 'SfPro',
                        color: AppColors.typeGrass,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          child: Text(
                            "Gender",
                            style: AppTextStyles.pokemonStat,
                          ),
                        ),
                        Text(
                          "♀ 87.5%, ",
                          style: AppTextStyles.pokemonMaleText,
                        ),
                        Text(
                          "♂ 12.5%",
                          style: AppTextStyles.pokemonFemaleText,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          child: Text(
                            "Egg Groups",
                            style: AppTextStyles.pokemonStat,
                          ),
                        ),
                        Text(
                          "Grass, Monster",
                          style: AppTextStyles.description,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          child: Text(
                            "Egg Cycles",
                            style: AppTextStyles.pokemonStat,
                          ),
                        ),
                        Text(
                          "20",
                          style: AppTextStyles.description,
                        ),
                        Text(
                          " (4,884-5,140 steps)",
                          style: AppTextStyles.pokemonStatValueSmall,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Location",
                      style: TextStyle(
                        fontFamily: 'SfPro',
                        color: AppColors.typeGrass,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          child: Text(
                            "001",
                            style: AppTextStyles.pokemonStat,
                          ),
                        ),
                        Text(
                          "(Red/Blue/Yellon)",
                          style: AppTextStyles.description,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          child: Text(
                            "226",
                            style: AppTextStyles.pokemonStat,
                          ),
                        ),
                        Text(
                          "(Gold/Silver/Crystal)",
                          style: AppTextStyles.description,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          child: Text(
                            "001",
                            style: AppTextStyles.pokemonStat,
                          ),
                        ),
                        Text(
                          "(FireRed/LeafGreen)",
                          style: AppTextStyles.description,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          child: Text(
                            "231",
                            style: AppTextStyles.pokemonStat,
                          ),
                        ),
                        Text(
                          "(HeartGold/SoulSilver)",
                          style: AppTextStyles.description,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          child: Text(
                            "080",
                            style: AppTextStyles.pokemonStat,
                          ),
                        ),
                        Text(
                          "(X/Y - Central Kalos)",
                          style: AppTextStyles.description,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          child: Text(
                            "001",
                            style: AppTextStyles.pokemonStat,
                          ),
                        ),
                        Text(
                          "(Let's Go Pikachu/Let's Go Eevee)",
                          style: AppTextStyles.description,
                        ),
                      ],
                    ),
                  ],
                ),
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
