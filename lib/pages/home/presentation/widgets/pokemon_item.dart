import 'package:flutter/material.dart';
import 'package:pokedex_dev_challenge/core/styles/app_gradients.dart';
import 'package:pokedex_dev_challenge/core/core.dart';
import 'package:pokedex_dev_challenge/core/widgets/GradientIcon.dart';
import 'package:pokedex_dev_challenge/pages/home/presentation/widgets/badge.dart';

class PokemonItem extends StatelessWidget {
  const PokemonItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                color: AppColors.backgroundTypeGrass,
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
          child: Image.asset(
            AppImages.bulbassaur,
            width: 130,
            height: 130,
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
                "#001",
                style: AppTextStyles.pokemonNumber,
              ),
              Text(
                "Bulbassaur",
                style: AppTextStyles.pokemonName,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Badge(
                    type: "grass",
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Badge(type: "poison"),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
