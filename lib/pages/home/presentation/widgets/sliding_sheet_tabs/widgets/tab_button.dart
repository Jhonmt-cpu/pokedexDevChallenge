import 'package:flutter/material.dart';
import 'package:pokedex_dev_challenge/core/core.dart';

class TabButton extends StatelessWidget {
  const TabButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.isSelcted,
  }) : super(key: key);

  final void Function() onPressed;
  final String text;
  final bool isSelcted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(2),
            backgroundColor: isSelcted
                ? MaterialStateProperty.all<Color>(
                    AppColors.typePsychic,
                  )
                : MaterialStateProperty.all<Color>(
                    AppColors.backgroundDefaultInput,
                  ),
            shadowColor: isSelcted
                ? MaterialStateProperty.all<Color>(
                    AppColors.typePsychic,
                  )
                : MaterialStateProperty.all<Color>(
                    Colors.transparent,
                  ),
            minimumSize: MaterialStateProperty.all<Size>(
              Size(
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
          style: isSelcted
              ? AppTextStyles.generationSelected
              : AppTextStyles.description,
        ),
      ),
    );
  }
}
