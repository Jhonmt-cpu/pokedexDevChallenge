import 'package:flutter/material.dart';
import 'package:pokedex_dev_challenge/core/core.dart';
import 'package:pokedex_dev_challenge/core/widgets/GradientIcon.dart';

class GenerationItem extends StatelessWidget {
  GenerationItem({
    Key? key,
    required this.generationId,
    required this.isSelected,
  })  : assert(generationId >= 1 && generationId <= 8),
        super(key: key);

  final int generationId;
  final bool isSelected;

  final config = [
    {
      "image1": AppImages.pokemon001,
      "image2": AppImages.pokemon004,
      "image3": AppImages.pokemon007,
    },
    {
      "image1": AppImages.pokemon152,
      "image2": AppImages.pokemon155,
      "image3": AppImages.pokemon158,
    },
    {
      "image1": AppImages.pokemon252,
      "image2": AppImages.pokemon255,
      "image3": AppImages.pokemon258,
    },
    {
      "image1": AppImages.pokemon387,
      "image2": AppImages.pokemon390,
      "image3": AppImages.pokemon393,
    },
    {
      "image1": AppImages.pokemon495,
      "image2": AppImages.pokemon498,
      "image3": AppImages.pokemon501,
    },
    {
      "image1": AppImages.pokemon650,
      "image2": AppImages.pokemon653,
      "image3": AppImages.pokemon656,
    },
    {
      "image1": AppImages.pokemon722,
      "image2": AppImages.pokemon725,
      "image3": AppImages.pokemon728,
    },
    {
      "image1": AppImages.pokemon810,
      "image2": AppImages.pokemon813,
      "image3": AppImages.pokemon816,
    },
  ];

  @override
  Widget build(BuildContext context) {
    String image1 = config[generationId - 1]["image1"] as String;
    String image2 = config[generationId - 1]["image2"] as String;
    String image3 = config[generationId - 1]["image3"] as String;
    Color backgroundColor =
        isSelected ? AppColors.typePsychic : AppColors.backgroundDefaultInput;
    return Stack(
      children: [
        Container(
          height: 129,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Positioned(
          left: 15,
          top: -10,
          child: GradientIcon(
            icon: AppImages.pattern6x3,
            size: 80,
            gradient: AppGradients.gradientVectorWhite,
          ),
        ),
        Positioned(
          right: -10,
          bottom: -52,
          child: GradientIcon(
            icon: AppImages.pokeball,
            size: 110,
            gradient: AppGradients.gradientPokeballWhite,
          ),
        ),
        Container(
          height: 129,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    image1,
                    width: 45,
                  ),
                  Container(
                    transform: Matrix4.translationValues(-5, 0, 0),
                    child: Image.asset(
                      image2,
                      width: 45,
                    ),
                  ),
                  Container(
                    transform: Matrix4.translationValues(-5, 0, 0),
                    child: Image.asset(
                      image3,
                      width: 45,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Generation l",
                style: AppTextStyles.generationSelected,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
