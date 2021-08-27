import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex_dev_challenge/core/styles/app_colors.dart';
import 'package:pokedex_dev_challenge/core/core.dart';
import 'package:pokedex_dev_challenge/core/values/pokemon_type_list.dart';
import 'package:pokedex_dev_challenge/core/values/type_colors_config.dart';

class Badge extends StatelessWidget {
  final String type;

  Badge({
    Key? key,
    required this.type,
  })  : assert(PokemonTypeList.pokemonTypeList.contains(type)),
        super(key: key);

  final config = {
    "grass": {
      "icon": AppImages.grass,
      "text": "Grass",
    },
    "poison": {
      "icon": AppImages.poison,
      "text": "Poison",
    },
    "bug": {
      "icon": AppImages.bug,
      "text": "Bug",
    },
    "dark": {
      "icon": AppImages.dark,
      "text": "Dark",
    },
    "dragon": {
      "icon": AppImages.dragon,
      "text": "Dragon",
    },
    "electric": {
      "icon": AppImages.electric,
      "text": "Electric",
    },
    "fairy": {
      "icon": AppImages.fairy,
      "text": "Fairy",
    },
    "fighting": {
      "icon": AppImages.fighting,
      "text": "Fighting",
    },
    "fire": {
      "icon": AppImages.fire,
      "text": "Fire",
    },
    "flying": {
      "icon": AppImages.flying,
      "text": "Flying",
    },
    "ghost": {
      "icon": AppImages.ghost,
      "text": "Ghost",
    },
    "ground": {
      "icon": AppImages.ground,
      "text": "Ground",
    },
    "ice": {
      "icon": AppImages.ice,
      "text": "Ice",
    },
    "normal": {
      "icon": AppImages.normal,
      "text": "Normal",
    },
    "psychic": {
      "icon": AppImages.psychic,
      "text": "Psychic",
    },
    "rock": {
      "icon": AppImages.rock,
      "text": "Rock",
    },
    "steel": {
      "icon": AppImages.steel,
      "text": "Steel",
    },
    "water": {
      "icon": AppImages.water,
      "text": "Water",
    },
  };

  Color get color => typeColorsConfig[type] as Color;
  String get icon => config[type]!["icon"] as String;
  String get text => config[type]!["text"] as String;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 13.88,
              color: AppColors.textWhite,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                text,
                style: AppTextStyles.pokemonType,
              ),
            )
          ],
        ),
      ),
    );
  }
}
