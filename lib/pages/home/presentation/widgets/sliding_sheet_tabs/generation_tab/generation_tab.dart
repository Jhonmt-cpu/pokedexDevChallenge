import 'package:flutter/material.dart';
import 'package:pokedex_dev_challenge/core/core.dart';
import 'package:pokedex_dev_challenge/pages/home/presentation/widgets/sliding_sheet_tabs/generation_tab/widgets/generation_item.dart';

class GenerationTab extends StatelessWidget {
  const GenerationTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 30,
        left: 40,
        right: 40,
        bottom: 50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Generations",
            style: AppTextStyles.tabTitle,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 5,
              bottom: 35,
            ),
            child: Text(
              "Use search for generations to explore your Pokémon",
              style: AppTextStyles.description,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: GenerationItem(
                  generationId: 1,
                  isSelected: true,
                ),
              ),
              SizedBox(
                width: 14,
              ),
              Expanded(
                child: GenerationItem(
                  generationId: 2,
                  isSelected: false,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 14,
          ),
          Row(
            children: [
              Expanded(
                child: GenerationItem(
                  generationId: 3,
                  isSelected: true,
                ),
              ),
              SizedBox(
                width: 14,
              ),
              Expanded(
                child: GenerationItem(
                  generationId: 4,
                  isSelected: false,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 14,
          ),
          Row(
            children: [
              Expanded(
                child: GenerationItem(
                  generationId: 5,
                  isSelected: true,
                ),
              ),
              SizedBox(
                width: 14,
              ),
              Expanded(
                child: GenerationItem(
                  generationId: 6,
                  isSelected: false,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 14,
          ),
          Row(
            children: [
              Expanded(
                child: GenerationItem(
                  generationId: 7,
                  isSelected: true,
                ),
              ),
              SizedBox(
                width: 14,
              ),
              Expanded(
                child: GenerationItem(
                  generationId: 8,
                  isSelected: false,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
