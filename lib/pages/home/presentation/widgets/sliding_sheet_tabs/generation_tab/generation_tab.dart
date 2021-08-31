import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_dev_challenge/core/core.dart';
import 'package:pokedex_dev_challenge/pages/home/bloc/generation_tab/generation_tab_bloc.dart';
import 'package:pokedex_dev_challenge/pages/home/bloc/home_bloc/home_bloc.dart';
import 'package:pokedex_dev_challenge/pages/home/presentation/widgets/sliding_sheet_tabs/generation_tab/widgets/generation_item.dart';

class GenerationTab extends StatelessWidget {
  const GenerationTab({
    Key? key,
    required this.homeBloc,
    required this.generationTabBloc,
  }) : super(key: key);

  final HomeBloc homeBloc;
  final GenerationTabBloc generationTabBloc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 30,
        left: 40,
        right: 40,
        bottom: 50,
      ),
      child: BlocBuilder<GenerationTabBloc, GenerationTabState>(
        bloc: generationTabBloc,
        builder: (context, state) {
          state as GeneraionTabSelected;
          return Column(
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
              ...[1, 2, 3, 4].map((e) {
                int firstId = (e * 2) - 1;
                int secondId = e * 2;
                return Padding(
                  padding: EdgeInsets.only(bottom: 14),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            if (generationTabBloc.generationId != firstId) {
                              generationTabBloc.add(ChangeGeneration(
                                generationIdSelected: firstId,
                              ));
                              homeBloc.add(FetchHomeListEvent(
                                generationId: firstId,
                              ));
                            }
                          },
                          child: GenerationItem(
                            generationId: firstId,
                            isSelected: firstId == state.generationIdSelected,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            if (generationTabBloc.generationId != secondId) {
                              generationTabBloc.add(ChangeGeneration(
                                generationIdSelected: secondId,
                              ));
                              homeBloc.add(FetchHomeListEvent(
                                generationId: secondId,
                              ));
                            }
                          },
                          child: GenerationItem(
                            generationId: secondId,
                            isSelected: secondId == state.generationIdSelected,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ],
          );
        },
      ),
    );
  }
}
