import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex_dev_challenge/app/helpers/styles/app_colors.dart';

class GenericFilterBadge extends StatelessWidget {
  final Color color;
  final String icon;
  final bool isSelected;

  const GenericFilterBadge({
    Key? key,
    required this.isSelected,
    required this.color,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? color : AppColors.textWhite,
          borderRadius: BorderRadius.circular(35),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.5),
          child: SvgPicture.asset(
            icon,
            color: isSelected ? AppColors.textWhite : color,
          ),
        ),
      ),
    );
  }
}
