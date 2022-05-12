import 'package:flutter/material.dart';
import 'package:pokedex_dev_challenge/app/helpers/styles/app_colors.dart';
import 'package:pokedex_dev_challenge/app/helpers/styles/app_text_styles.dart';

class TabButton extends StatelessWidget {
  const TabButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.isSelected,
  }) : super(key: key);

  final void Function() onPressed;
  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(2),
            backgroundColor: isSelected
                ? MaterialStateProperty.all<Color>(
                    AppColors.typePsychic,
                  )
                : MaterialStateProperty.all<Color>(
                    AppColors.backgroundDefaultInput,
                  ),
            shadowColor: isSelected
                ? MaterialStateProperty.all<Color>(
                    AppColors.typePsychic,
                  )
                : MaterialStateProperty.all<Color>(
                    Colors.transparent,
                  ),
            minimumSize: MaterialStateProperty.all<Size>(
              const Size(
                double.infinity,
                60,
              ),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ))),
        onPressed: onPressed,
        child: Text(
          text,
          style: isSelected
              ? AppTextStyles.generationSelected
              : AppTextStyles.description,
        ),
      ),
    );
  }
}
