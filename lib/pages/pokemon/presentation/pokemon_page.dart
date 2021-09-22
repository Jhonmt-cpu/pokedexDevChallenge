import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex_dev_challenge/core/core.dart';
import 'package:pokedex_dev_challenge/pages/home/domain/models/pokemons_generation.dart';
import 'package:pokedex_dev_challenge/pages/pokemon/domain/pokemon_page_args.dart';
import 'package:pokedex_dev_challenge/pages/pokemon/presentation/widgets/pokemon_page_item.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class PokemonPage extends StatelessWidget {
  const PokemonPage({
    Key? key,
  }) : super(key: key);

  static const routeName = '/pokemon_page';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as PokemonPageArgs;

    String pokemonName = args.pokemon.name.toUpperCase();

    Color backgroundColor = _defineBackgroundTypeColor(args.pokemon
        .pokemonV2Pokemons[0].pokemonV2Pokemontypes[0].pokemonV2Type.name);

    final double screenSize = MediaQuery.of(context).size.width;

    final Size pokemonNameSize = _textSize(pokemonName, AppTextStyles.title);

    double containerPadding = (screenSize - pokemonNameSize.width) / 2;

    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: false,
      body: SlidingSheet(
        shadowColor: backgroundColor,
        color: backgroundColor,
        snapSpec: const SnapSpec(
          // Enable snapping. This is true by default.
          snap: true,
          // Set custom snapping points.
          snappings: [0.65, 0.9],
          // Define to what the snappings relate to. In this case,
          // the total available space that the sheet can expand to.
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),

        // The body widget will be displayed under the SlidingSheet
        // and a parallax effect can be applied to it.
        body: SafeArea(
          child: Container(
            height: 265,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: containerPadding,
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      final Rect rect =
                          Rect.fromLTRB(0, 0, bounds.width, bounds.height);
                      return AppGradients.pokemonTitleName.createShader(rect);
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
                Positioned(
                  bottom: 0,
                  right: -70,
                  child: GradientIcon(
                    gradient: AppGradients.gradientVectorWhite,
                    icon: AppImages.pattern10x5,
                    size: 140,
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
                PokemonPageItem(
                  pokemon: args.pokemon,
                ),
              ],
            ),
          ),
        ),
        headerBuilder: (context, state) {
          return Stack(
            children: [
              Container(
                height: 100,
                color: backgroundColor,
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
                  height: 50,
                ),
              ),
              Row(
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
                          gradient: AppGradients.gradientVectorWhite,
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(
                              bottom: 49,
                            ),
                            child: Text(
                              "About",
                              style: AppTextStyles.pokemonPageTabTitle,
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
                          gradient: AppGradients.gradientVectorWhite,
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(
                              bottom: 49,
                            ),
                            child: Text(
                              "Stats",
                              style: AppTextStyles.pokemonPageTabTitle,
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
                          gradient: AppGradients.gradientVectorWhite,
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(
                              bottom: 49,
                            ),
                            child: Text(
                              "Evolution",
                              style: AppTextStyles.pokemonPageTabTitle,
                            ),
                          ),
                        ),
                      ],
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
          return Container(
            height: 10000,
            transform: Matrix4.translationValues(0, -20, 0),
            color: AppColors.backgroundWhite,
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
