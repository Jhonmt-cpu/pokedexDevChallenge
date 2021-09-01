import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_dev_challenge/core/core.dart';
import 'package:pokedex_dev_challenge/pages/home/bloc/home_bloc/home_bloc.dart';
import 'package:pokedex_dev_challenge/pages/home/bloc/sort_tab/sort_tab_bloc.dart';
import 'package:pokedex_dev_challenge/pages/home/presentation/widgets/sliding_sheet_tabs/widgets/sort_button.dart';

class SortTab extends StatelessWidget {
  const SortTab({
    Key? key,
    required this.homeBloc,
    required this.sortTabBloc,
  }) : super(key: key);

  final HomeBloc homeBloc;

  final SortTabBloc sortTabBloc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 30,
        left: 40,
        right: 40,
        bottom: 50,
      ),
      child: BlocBuilder<SortTabBloc, SortTabState>(
        bloc: sortTabBloc,
        builder: (context, state) {
          state as SortTabSelected;
          return Column(
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
              SortButton(
                onPressed: () {
                  if (sortTabBloc.sortTypeId != 1) {
                    homeBloc.add(
                      SortListEvent(sortType: 1),
                    );
                    sortTabBloc.add(
                      ChangeSortType(sortTypeId: 1),
                    );
                  }
                },
                text: "Smallest number first",
                isSelcted: state.sortTypeId == 1,
              ),
              SortButton(
                onPressed: () {
                  if (sortTabBloc.sortTypeId != 2) {
                    homeBloc.add(
                      SortListEvent(sortType: 2),
                    );
                    sortTabBloc.add(
                      ChangeSortType(sortTypeId: 2),
                    );
                  }
                },
                text: "Highest number first",
                isSelcted: state.sortTypeId == 2,
              ),
              SortButton(
                onPressed: () {
                  if (sortTabBloc.sortTypeId != 3) {
                    homeBloc.add(
                      SortListEvent(sortType: 3),
                    );
                    sortTabBloc.add(
                      ChangeSortType(sortTypeId: 3),
                    );
                  }
                },
                text: "A-Z",
                isSelcted: state.sortTypeId == 3,
              ),
              SortButton(
                onPressed: () {
                  if (sortTabBloc.sortTypeId != 4) {
                    homeBloc.add(
                      SortListEvent(sortType: 4),
                    );
                    sortTabBloc.add(
                      ChangeSortType(sortTypeId: 4),
                    );
                  }
                },
                text: "Z-A",
                isSelcted: state.sortTypeId == 4,
              ),
            ],
          );
        },
      ),
    );
  }
}
