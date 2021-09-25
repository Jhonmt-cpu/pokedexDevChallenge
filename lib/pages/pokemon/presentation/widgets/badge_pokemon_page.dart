import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex_dev_challenge/core/styles/app_colors.dart';
import 'package:pokedex_dev_challenge/core/core.dart';
import 'package:pokedex_dev_challenge/core/values/pokemon_type_list.dart';
import 'package:pokedex_dev_challenge/core/values/type_colors_config.dart';

class BadgePokemonPage extends StatelessWidget {
  final String type;

  BadgePokemonPage({
    Key? key,
    required this.type,
  })  : assert(PokemonTypeList.pokemonTypeList.contains(type)),
        super(key: key);

  final config = {
    "grass": AppImages.grass,
    "poison": AppImages.poison,
    "bug": AppImages.bug,
    "dark": AppImages.dark,
    "dragon": AppImages.dragon,
    "electric": AppImages.electric,
    "fairy": AppImages.fairy,
    "fighting": AppImages.fighting,
    "fire": AppImages.fire,
    "flying": AppImages.flying,
    "ghost": AppImages.ghost,
    "ground": AppImages.ground,
    "ice": AppImages.ice,
    "normal": AppImages.normal,
    "psychic": AppImages.psychic,
    "rock": AppImages.rock,
    "steel": AppImages.steel,
    "water": AppImages.water,
  };

  Color get color => typeColorsConfig[type] as Color;
  String get icon => config[type] as String;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: color,
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SvgPicture.asset(
            icon,
            width: 13.88,
            color: AppColors.textWhite,
          ),
        ),
      ),
    );
  }
}
