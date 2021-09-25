import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex_dev_challenge/core/core.dart';

class EvolutionTab extends StatelessWidget {
  const EvolutionTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Evolution Chart",
          style: TextStyle(
            fontFamily: 'SfPro',
            color: AppColors.typeGrass,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    GradientIcon(
                      icon: AppImages.pokeball,
                      size: 100,
                      gradient: AppGradients.gradientPokeball,
                    ),
                    Positioned(
                      top: 12.5,
                      left: 12.5,
                      child: CachedNetworkImage(
                        width: 75,
                        height: 75,
                        imageUrl:
                            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png",
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                          child: Container(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              value: downloadProgress.progress,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                typeColorsConfig["grass"] as Color,
                                // typeColorsConfig[pokemon
                                //     .pokemonV2Pokemons[0]
                                //     .pokemonV2Pokemontypes[0]
                                //     .pokemonV2Type
                                //     .name] as Color,
                              ),
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ],
                ),
                Text(
                  "#001",
                  style: AppTextStyles.pokemonNumberEvolutionTab,
                ),
                Text(
                  "Bulbasaur",
                  style: AppTextStyles.filterTitle,
                ),
              ],
            ),
            Column(
              children: [
                SvgPicture.asset(
                  AppImages.front,
                  color: AppColors.textGray.withOpacity(0.1),
                  height: 25,
                  width: 25,
                ),
                Text(
                  "(Level 16)",
                  style: AppTextStyles.pokemonEvolutionLevel,
                ),
              ],
            ),
            Column(
              children: [
                Stack(
                  children: [
                    GradientIcon(
                      icon: AppImages.pokeball,
                      size: 100,
                      gradient: AppGradients.gradientPokeball,
                    ),
                    Positioned(
                      top: 12.5,
                      left: 12.5,
                      child: CachedNetworkImage(
                        width: 75,
                        height: 75,
                        imageUrl:
                            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/2.png",
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                          child: Container(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              value: downloadProgress.progress,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                typeColorsConfig["grass"] as Color,
                                // typeColorsConfig[pokemon
                                //     .pokemonV2Pokemons[0]
                                //     .pokemonV2Pokemontypes[0]
                                //     .pokemonV2Type
                                //     .name] as Color,
                              ),
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ],
                ),
                Text(
                  "#002",
                  style: AppTextStyles.pokemonNumberEvolutionTab,
                ),
                Text(
                  "Ivysaur",
                  style: AppTextStyles.filterTitle,
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    GradientIcon(
                      icon: AppImages.pokeball,
                      size: 100,
                      gradient: AppGradients.gradientPokeball,
                    ),
                    Positioned(
                      top: 12.5,
                      left: 12.5,
                      child: CachedNetworkImage(
                        width: 75,
                        height: 75,
                        imageUrl:
                            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/2.png",
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                          child: Container(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              value: downloadProgress.progress,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                typeColorsConfig["grass"] as Color,
                                // typeColorsConfig[pokemon
                                //     .pokemonV2Pokemons[0]
                                //     .pokemonV2Pokemontypes[0]
                                //     .pokemonV2Type
                                //     .name] as Color,
                              ),
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ],
                ),
                Text(
                  "#002",
                  style: AppTextStyles.pokemonNumberEvolutionTab,
                ),
                Text(
                  "Ivysaur",
                  style: AppTextStyles.filterTitle,
                ),
              ],
            ),
            Column(
              children: [
                SvgPicture.asset(
                  AppImages.front,
                  color: AppColors.textGray.withOpacity(0.1),
                  height: 25,
                  width: 25,
                ),
                Text(
                  "(Level 32)",
                  style: AppTextStyles.pokemonEvolutionLevel,
                ),
              ],
            ),
            Column(
              children: [
                Stack(
                  children: [
                    GradientIcon(
                      icon: AppImages.pokeball,
                      size: 100,
                      gradient: AppGradients.gradientPokeball,
                    ),
                    Positioned(
                      top: 12.5,
                      left: 12.5,
                      child: CachedNetworkImage(
                        width: 75,
                        height: 75,
                        imageUrl:
                            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/3.png",
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                          child: Container(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              value: downloadProgress.progress,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                typeColorsConfig["grass"] as Color,
                                // typeColorsConfig[pokemon
                                //     .pokemonV2Pokemons[0]
                                //     .pokemonV2Pokemontypes[0]
                                //     .pokemonV2Type
                                //     .name] as Color,
                              ),
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ],
                ),
                Text(
                  "#003",
                  style: AppTextStyles.pokemonNumberEvolutionTab,
                ),
                Text(
                  "Venusaur",
                  style: AppTextStyles.filterTitle,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
