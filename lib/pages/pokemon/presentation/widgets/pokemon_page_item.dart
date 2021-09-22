import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_dev_challenge/core/styles/app_gradients.dart';
import 'package:pokedex_dev_challenge/core/core.dart';
import 'package:pokedex_dev_challenge/core/values/type_colors_config.dart';
import 'package:pokedex_dev_challenge/core/widgets/gradient_icon.dart';
import 'package:pokedex_dev_challenge/pages/home/domain/models/pokemons_generation.dart';
import 'package:pokedex_dev_challenge/pages/home/presentation/widgets/badge.dart';
import 'package:pokedex_dev_challenge/pages/pokemon/domain/pokemon_page_args.dart';
import 'package:pokedex_dev_challenge/pages/pokemon/presentation/pokemon_page.dart';

class PokemonPageItem extends StatelessWidget {
  const PokemonPageItem({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final PokemonV2Pokemonspecies pokemon;

  @override
  Widget build(BuildContext context) {
    String name = pokemon.name;
    String nameWithFirstUpperCase = name[0].toUpperCase() + name.substring(1);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            GradientIcon(
              gradient: AppGradients.pokemonCircle,
              icon: AppImages.circle,
              size: 125,
            ),
            Hero(
              tag: "imageFromHome${pokemon.id}",
              child: CachedNetworkImage(
                width: 125,
                height: 125,
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
                            .pokemonV2Pokemons[0]
                            .pokemonV2Pokemontypes[0]
                            .pokemonV2Type
                            .name] as Color,
                      ),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 25,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "#" + pokemon.id.toString().padLeft(3, '0'),
                style: AppTextStyles.pokemonPageNumber,
              ),
              Text(
                nameWithFirstUpperCase,
                style: AppTextStyles.pokemonPageName,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: pokemon.pokemonV2Pokemons[0].pokemonV2Pokemontypes
                    .map((element) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Badge(type: element.pokemonV2Type.name),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
