import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex_dev_challenge/core/styles/app_colors.dart';
import 'package:pokedex_dev_challenge/core/core.dart';
import 'package:pokedex_dev_challenge/core/values/pokemon_type_list.dart';

class Badge extends StatelessWidget {
  final String type;

  Badge({
    Key? key,
    required this.type,
  })  : assert(PokemonTypeList.pokemonTypeList.contains(type)),
        super(key: key);

  final config = {
    "grass": {
      "color": AppColors.typeGrass,
      "icon": AppImages.grass,
      "text": "Grass"
    },
    "poison": {
      "color": AppColors.typePoison,
      "icon": AppImages.poison,
      "text": "Poison"
    },
  };

  Color get color => config[type]!["color"]! as Color;
  String get icon => config[type]!["icon"]! as String;
  String get text => config[type]!["text"]! as String;

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
