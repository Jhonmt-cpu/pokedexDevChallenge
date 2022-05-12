import 'package:flutter/material.dart';
import 'package:pokedex_dev_challenge/app/helpers/styles/app_text_styles.dart';
import 'package:pokedex_dev_challenge/ui/home/components/tabs/components/tab_button.dart';

class SortTab extends StatelessWidget {
  final int sortTypeId;

  const SortTab({
    Key? key,
    required this.sortTypeId,
  }) : super(key: key);

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
            "Sort",
            style: AppTextStyles.tabTitle,
          ),
          Padding(
            padding: const EdgeInsets.only(
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
              // if (sortTabBloc.sortTypeId != 1) {
              //   homeBloc.add(
              //     SortListEvent(sortType: 1),
              //   );
              //   sortTabBloc.add(
              //     ChangeSortType(sortTypeId: 1),
              //   );
              // }
            },
            text: "Smallest number first",
            isSelcted: sortTypeId == 1,
          ),
          TabButton(
            onPressed: () {
              // if (sortTabBloc.sortTypeId != 2) {
              //   homeBloc.add(
              //     SortListEvent(sortType: 2),
              //   );
              //   sortTabBloc.add(
              //     ChangeSortType(sortTypeId: 2),
              //   );
              // }
            },
            text: "Highest number first",
            isSelcted: sortTypeId == 2,
          ),
          TabButton(
            onPressed: () {
              // if (sortTabBloc.sortTypeId != 3) {
              //   homeBloc.add(
              //     SortListEvent(sortType: 3),
              //   );
              //   sortTabBloc.add(
              //     ChangeSortType(sortTypeId: 3),
              //   );
              // }
            },
            text: "A-Z",
            isSelcted: sortTypeId == 3,
          ),
          TabButton(
            onPressed: () {
              // if (sortTabBloc.sortTypeId != 4) {
              //   homeBloc.add(
              //     SortListEvent(sortType: 4),
              //   );
              //   sortTabBloc.add(
              //     ChangeSortType(sortTypeId: 4),
              //   );
              // }
            },
            text: "Z-A",
            isSelcted: sortTypeId == 4,
          ),
        ],
      ),
    );
  }
}
