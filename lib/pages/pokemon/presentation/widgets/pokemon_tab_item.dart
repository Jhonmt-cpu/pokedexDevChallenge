import 'package:flutter/material.dart';
import 'package:pokedex_dev_challenge/core/assets/app_images.dart';
import 'package:pokedex_dev_challenge/core/core.dart';
import 'package:pokedex_dev_challenge/core/widgets/gradient_icon.dart';

class PokemonTabItem extends StatelessWidget {
  const PokemonTabItem({
    Key? key,
    required this.text,
    required this.isSelected,
  }) : super(key: key);

  final String text;

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Stack(
        children: [
          isSelected
              ? GradientIcon(
                  icon: AppImages.pokeball,
                  size: 100,
                  gradient: AppGradients.gradientVectorWhite,
                )
              : Container(
                  height: 100,
                ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 49,
              ),
              child: Text(
                text,
                style: isSelected
                    ? AppTextStyles.pokemonPageTabTitleSelected
                    : AppTextStyles.pokemonPageTabTitleNotSelected,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
