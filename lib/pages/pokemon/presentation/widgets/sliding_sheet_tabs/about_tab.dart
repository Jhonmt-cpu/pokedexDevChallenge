import 'package:flutter/material.dart';
import 'package:pokedex_dev_challenge/core/core.dart';
import 'package:pokedex_dev_challenge/pages/pokemon/presentation/widgets/sliding_sheet_tabs/widgets/badge_pokemon_page.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
