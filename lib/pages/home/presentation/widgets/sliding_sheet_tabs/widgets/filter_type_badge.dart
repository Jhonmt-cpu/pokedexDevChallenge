import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex_dev_challenge/core/core.dart';
import '../../../../../../core/assets/app_images.dart';
import '../../../../../../core/values/pokemon_type_list.dart';
import '../../../../../../core/values/type_colors_config.dart';

class FilterTypeBadge extends StatelessWidget {
  final String type;
  final bool isSelected;

  FilterTypeBadge({
    Key? key,
    required this.type,
    required this.isSelected,
  })  : assert(PokemonTypeList.pokemonTypeList.contains(type)),
        super(key: key);

  final config = {
    "grass": {
      "icon": AppImages.grass,
    },
    "poison": {
      "icon": AppImages.poison,
    },
    "bug": {
      "icon": AppImages.bug,
    },
    "dark": {
      "icon": AppImages.dark,
    },
    "dragon": {
      "icon": AppImages.dragon,
    },
    "electric": {
      "icon": AppImages.electric,
    },
    "fairy": {
      "icon": AppImages.fairy,
    },
    "fighting": {
      "icon": AppImages.fighting,
    },
    "fire": {
      "icon": AppImages.fire,
    },
    "flying": {
      "icon": AppImages.flying,
    },
    "ghost": {
      "icon": AppImages.ghost,
    },
    "ground": {
      "icon": AppImages.ground,
    },
    "ice": {
      "icon": AppImages.ice,
    },
    "normal": {
      "icon": AppImages.normal,
    },
    "psychic": {
      "icon": AppImages.psychic,
    },
    "rock": {
      "icon": AppImages.rock,
    },
    "steel": {
      "icon": AppImages.steel,
    },
    "water": {
      "icon": AppImages.water,
    },
  };

  Color get color => typeColorsConfig[type] as Color;
  String get icon => config[type]!["icon"] as String;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? color : AppColors.textWhite,
          borderRadius: BorderRadius.circular(35),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.5),
          child: SvgPicture.asset(
            icon,
            color: isSelected ? AppColors.textWhite : color,
          ),
        ),
      ),
    );
  }
}
