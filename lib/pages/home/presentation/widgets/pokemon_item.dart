import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_dev_challenge/core/styles/app_gradients.dart';
import 'package:pokedex_dev_challenge/core/core.dart';
import 'package:pokedex_dev_challenge/core/values/type_colors_config.dart';
import 'package:pokedex_dev_challenge/core/widgets/GradientIcon.dart';
import 'package:pokedex_dev_challenge/pages/home/domain/models/pokemons_generation.dart';
import 'package:pokedex_dev_challenge/pages/home/presentation/widgets/badge.dart';

class PokemonItem extends StatelessWidget {
  const PokemonItem({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final PokemonV2Pokemonspecies pokemon;

  @override
  Widget build(BuildContext context) {
    String name = pokemon.name!;
    String nameWithFirstUpperCase = name[0].toUpperCase() + name.substring(1);
    Color backgroundColor = _defineBackgroundTypeColor(
      pokemon
          .pokemonV2Pokemons![0].pokemonV2Pokemontypes![0].pokemonV2Type!.name!,
    );
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 25,
            ),
            Container(
              height: 115,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: backgroundColor,
              ),
            ),
          ],
        ),
        Positioned(
          top: 10,
          left: 70,
          child: GradientIcon(
            gradient: AppGradients.gradientVector,
            icon: AppImages.pattern6x3,
            size: 74,
          ),
        ),
        Positioned(
          top: 10,
          left: 180,
          child: GradientIcon(
            gradient: AppGradients.gradientVector,
            icon: AppImages.pokeball,
            size: 145,
          ),
        ),
        Positioned(
          top: 0,
          left: 170,
          child: CachedNetworkImage(
            width: 130,
            height: 130,
            imageUrl:
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemon.id}.png",
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
              child: Container(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  value: downloadProgress.progress,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    typeColorsConfig[pokemon
                        .pokemonV2Pokemons![0]
                        .pokemonV2Pokemontypes![0]
                        .pokemonV2Type!
                        .name!] as Color,
                  ),
                ),
              ),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 45,
            left: 20,
            bottom: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "#" + pokemon.id.toString().padLeft(3, '0'),
                style: AppTextStyles.pokemonNumber,
              ),
              Text(
                nameWithFirstUpperCase,
                style: AppTextStyles.pokemonName,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: pokemon.pokemonV2Pokemons![0].pokemonV2Pokemontypes!
                    .map((element) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Badge(type: element.pokemonV2Type!.name!),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ],
    );
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
}
