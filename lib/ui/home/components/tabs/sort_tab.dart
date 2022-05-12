import 'package:flutter/material.dart';
import 'package:pokedex_dev_challenge/app/helpers/styles/app_text_styles.dart';
import 'package:pokedex_dev_challenge/ui/home/components/tabs/components/tab_button.dart';

class SortTab extends StatelessWidget {
  final int sortTypeId;
  final Function(int) changeSortType;

  const SortTab({
    Key? key,
    required this.sortTypeId,
    required this.changeSortType,
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
            "Sort",
            style: AppTextStyles.tabTitle,
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 5,
              bottom: 35,
            ),
            child: Text(
              "Sort Pokémons alphabetically or by National Pokédex number!",
              style: AppTextStyles.description,
            ),
          ),
          TabButton(
            onPressed: () {
              if (sortTypeId != 1) {
                changeSortType(1);
              }
            },
            text: "Smallest number first",
            isSelected: sortTypeId == 1,
          ),
          TabButton(
            onPressed: () {
              if (sortTypeId != 2) {
                changeSortType(2);
              }
            },
            text: "Highest number first",
            isSelected: sortTypeId == 2,
          ),
          TabButton(
            onPressed: () {
              if (sortTypeId != 3) {
                changeSortType(3);
              }
            },
            text: "A-Z",
            isSelected: sortTypeId == 3,
          ),
          TabButton(
            onPressed: () {
              if (sortTypeId != 4) {
                changeSortType(4);
              }
            },
            text: "Z-A",
            isSelected: sortTypeId == 4,
          ),
        ],
      ),
    );
  }
}
