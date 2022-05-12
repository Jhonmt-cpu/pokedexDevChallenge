import 'package:flutter/material.dart';
import 'package:pokedex_dev_challenge/app/helpers/styles/app_text_styles.dart';
import 'package:pokedex_dev_challenge/app/helpers/values/strings.dart';
import 'package:pokedex_dev_challenge/ui/home/components/tabs/components/generation_item.dart';

class GenerationTab extends StatelessWidget {
  final int generationId;

  final Function(int generationId) changeGeneration;

  const GenerationTab({
    Key? key,
    required this.generationId,
    required this.changeGeneration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30,
        left: 40,
        right: 40,
        bottom: 50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            Strings.generationTabTitle,
            style: AppTextStyles.tabTitle,
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 5,
              bottom: 35,
            ),
            child: Text(
              Strings.generationTabInfo,
              style: AppTextStyles.description,
            ),
          ),
          ...[1, 2, 3, 4].map((e) {
            int firstId = (e * 2) - 1;
            int secondId = e * 2;
            return Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        if (generationId != firstId) {
                          changeGeneration(firstId);
                        }
                      },
                      child: GenerationItem(
                        generationId: firstId,
                        isSelected: firstId == generationId,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        if (generationId != secondId) {
                          changeGeneration(secondId);
                        }
                      },
                      child: GenerationItem(
                        generationId: secondId,
                        isSelected: secondId == generationId,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
