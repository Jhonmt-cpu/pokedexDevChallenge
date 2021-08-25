import 'package:flutter/material.dart';
import 'package:pokedex_dev_challenge/core/app_colors.dart';

class AppTextStyles {
  static final TextStyle applicationTitle = TextStyle(
    fontFamily: 'SfPro',
    color: AppColors.textBlack,
    fontSize: 32,
    fontWeight: FontWeight.w700,
  );
  static final TextStyle description = TextStyle(
    fontFamily: 'SfPro',
    color: AppColors.textGray,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle pokemonName = TextStyle(
    fontFamily: 'SfPro',
    color: AppColors.textWhite,
    fontSize: 26,
    fontWeight: FontWeight.w700,
  );
  static final TextStyle pokemonNumber = TextStyle(
    fontFamily: 'SfPro',
    color: AppColors.textNumber,
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );
  static final TextStyle pokemonType = TextStyle(
    fontFamily: 'SfPro',
    color: AppColors.textWhite,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
}
