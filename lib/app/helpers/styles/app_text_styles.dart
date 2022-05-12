import 'package:flutter/material.dart';
import 'package:pokedex_dev_challenge/app/helpers/styles/app_colors.dart';

class AppTextStyles {
  static const TextStyle applicationTitle = TextStyle(
    fontFamily: 'SfPro',
    color: AppColors.textBlack,
    fontSize: 32,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle title = TextStyle(
    fontFamily: 'SfPro',
    color: Colors.transparent,
    fontSize: 100,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle description = TextStyle(
    fontFamily: 'SfPro',
    color: AppColors.textGray,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle generationSelected = TextStyle(
    fontFamily: 'SfPro',
    color: AppColors.textWhite,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle pokemonName = TextStyle(
    fontFamily: 'SfPro',
    color: AppColors.textWhite,
    fontSize: 26,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle pokemonNumber = TextStyle(
    fontFamily: 'SfPro',
    color: AppColors.textNumber,
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle pokemonType = TextStyle(
    fontFamily: 'SfPro',
    color: AppColors.textWhite,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle errorList = TextStyle(
    fontFamily: 'SfPro',
    color: AppColors.textGray,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle tabTitle = TextStyle(
    fontFamily: 'SfPro',
    color: AppColors.textBlack,
    fontSize: 26,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle filterTitle = TextStyle(
    fontFamily: 'SfPro',
    color: AppColors.textBlack,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle rangeSliderText = TextStyle(
    fontFamily: 'SfPro',
    color: AppColors.textGray,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle pokemonPageName = TextStyle(
    fontFamily: 'SfPro',
    color: AppColors.textWhite,
    fontSize: 32,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle pokemonPageNumber = TextStyle(
    fontFamily: 'SfPro',
    color: AppColors.textNumber,
    fontSize: 26,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle pokemonPageTabTitleSelected = TextStyle(
    fontFamily: 'SfPro',
    color: AppColors.textWhite,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );
  static TextStyle pokemonPageTabTitleNotSelected = TextStyle(
    fontFamily: 'SfPro',
    color: AppColors.textWhite.withOpacity(0.5),
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle pokemonStat = TextStyle(
    fontFamily: 'SfPro',
    color: AppColors.textBlack,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle pokemonStatValueSmall = TextStyle(
    fontFamily: 'SfPro',
    color: AppColors.textGray,
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle pokemonMaleText = TextStyle(
    fontFamily: 'SfPro',
    color: AppColors.typeFlying,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle pokemonFemaleText = TextStyle(
    fontFamily: 'SfPro',
    color: AppColors.typeFairy,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle pokemonNumberEvolutionTab = TextStyle(
    fontFamily: 'SfPro',
    color: AppColors.textGray,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle pokemonEvolutionLevel = TextStyle(
    fontFamily: 'SfPro',
    color: AppColors.textBlack,
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );
}
