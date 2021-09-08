import 'package:another_xlider/another_xlider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_dev_challenge/core/core.dart';
import 'package:pokedex_dev_challenge/core/values/pokemon_type_list.dart';
import 'package:pokedex_dev_challenge/pages/home/bloc/filter_tab/filter_tab_bloc.dart';
import 'package:pokedex_dev_challenge/pages/home/bloc/home_bloc/home_bloc.dart';
import 'package:pokedex_dev_challenge/pages/home/presentation/widgets/sliding_sheet_tabs/widgets/filter_type_badge.dart';
import 'package:pokedex_dev_challenge/pages/home/presentation/widgets/sliding_sheet_tabs/widgets/generic_filter_badge.dart';
import 'package:pokedex_dev_challenge/pages/home/presentation/widgets/sliding_sheet_tabs/widgets/tab_button.dart';

class FilterTab extends StatelessWidget {
  const FilterTab({
    Key? key,
    required this.homeBloc,
    required this.filterTabBloc,
  }) : super(key: key);

  final HomeBloc homeBloc;

  final FilterTabBloc filterTabBloc;

  @override
  Widget build(BuildContext context) {
    double screanWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
        top: 30,
        left: 40,
        bottom: 50,
      ),
      child: BlocBuilder<FilterTabBloc, FilterTabState>(
        bloc: filterTabBloc,
        builder: (context, state) {
          state as FilterTabItensSelected;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Filters",
                style: AppTextStyles.tabTitle,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                  bottom: 35,
                ),
                child: Text(
                  "Use advanced search to explore Pokémon by\ntype, weakness, height and more!",
                  style: AppTextStyles.description,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "Types",
                  style: AppTextStyles.filterTitle,
                ),
              ),
              SizedBox(
                width: screanWidth - 40,
                height: 50,
                child: ListView.builder(
                  padding: EdgeInsets.only(right: 10),
                  scrollDirection: Axis.horizontal,
                  itemCount: PokemonTypeList.pokemonTypeList.length,
                  itemBuilder: (context, index) {
                    String type = PokemonTypeList.pokemonTypeList[index];
                    bool isSelected = state.types.contains(type);
                    return Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: () {
                          filterTabBloc.add(
                            ChangeTypesEvent(
                              type: type,
                              shouldAdd: !isSelected,
                            ),
                          );
                        },
                        child: FilterTypeBadge(
                          type: type,
                          isSelected: isSelected,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "Weaknesses",
                  style: AppTextStyles.filterTitle,
                ),
              ),
              SizedBox(
                width: screanWidth - 40,
                height: 50,
                child: ListView.builder(
                  padding: EdgeInsets.only(right: 10),
                  scrollDirection: Axis.horizontal,
                  itemCount: PokemonTypeList.pokemonTypeList.length,
                  itemBuilder: (context, index) {
                    String weakness = PokemonTypeList.pokemonTypeList[index];
                    bool isSelected = state.weaknesses.contains(weakness);
                    return Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: () {
                          filterTabBloc.add(
                            ChangeWeaknessesEvent(
                              weakness: weakness,
                              shouldAdd: !isSelected,
                            ),
                          );
                        },
                        child: FilterTypeBadge(
                          type: weakness,
                          isSelected: isSelected,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "Heights",
                  style: AppTextStyles.filterTitle,
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {
                        filterTabBloc.add(
                          ChangeHeightsEvent(
                            height: "short",
                            shouldAdd: !state.heights.contains("short"),
                          ),
                        );
                      },
                      child: GenericFilterBadge(
                        color: AppColors.short,
                        icon: AppImages.short,
                        isSelected: state.heights.contains("short"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {
                        filterTabBloc.add(
                          ChangeHeightsEvent(
                            height: "medium",
                            shouldAdd: !state.heights.contains("medium"),
                          ),
                        );
                      },
                      child: GenericFilterBadge(
                        color: AppColors.medium,
                        icon: AppImages.medium,
                        isSelected: state.heights.contains("medium"),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      filterTabBloc.add(
                        ChangeHeightsEvent(
                          height: "tall",
                          shouldAdd: !state.heights.contains("tall"),
                        ),
                      );
                    },
                    child: GenericFilterBadge(
                      color: AppColors.tall,
                      icon: AppImages.tall,
                      isSelected: state.heights.contains("tall"),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "Weights",
                  style: AppTextStyles.filterTitle,
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {
                        filterTabBloc.add(
                          ChangeWeightsEvent(
                            weight: "light",
                            shouldAdd: !state.weights.contains("light"),
                          ),
                        );
                      },
                      child: GenericFilterBadge(
                        color: AppColors.light,
                        icon: AppImages.light,
                        isSelected: state.weights.contains("light"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {
                        filterTabBloc.add(
                          ChangeWeightsEvent(
                            weight: "normal",
                            shouldAdd: !state.weights.contains("normal"),
                          ),
                        );
                      },
                      child: GenericFilterBadge(
                        color: AppColors.normal,
                        icon: AppImages.normalW,
                        isSelected: state.weights.contains("normal"),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      filterTabBloc.add(
                        ChangeWeightsEvent(
                          weight: "heavy",
                          shouldAdd: !state.weights.contains("heavy"),
                        ),
                      );
                    },
                    child: GenericFilterBadge(
                      color: AppColors.heavy,
                      icon: AppImages.heavy,
                      isSelected: state.weights.contains("heavy"),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "Number Range",
                  style: AppTextStyles.filterTitle,
                ),
              ),
              state.minRangeNumber != null && state.maxRangeNumber != null
                  ? Padding(
                      padding: const EdgeInsets.only(
                        right: 40,
                      ),
                      child: FlutterSlider(
                        values: state.range,
                        rangeSlider: true,
                        min: state.minRangeNumber!.toDouble(),
                        max: state.maxRangeNumber!.toDouble(),
                        handlerAnimation: FlutterSliderHandlerAnimation(
                          scale: 1,
                        ),
                        handler: FlutterSliderHandler(
                          decoration: BoxDecoration(),
                          child: Container(
                            height: 20,
                            width: 20,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: AppColors.textWhite,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppColors.typePsychic,
                                width: 4,
                              ),
                            ),
                          ),
                        ),
                        rightHandler: FlutterSliderHandler(
                          decoration: BoxDecoration(),
                          child: Container(
                            height: 20,
                            width: 20,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: AppColors.textWhite,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppColors.typePsychic,
                                width: 4,
                              ),
                            ),
                          ),
                        ),
                        trackBar: FlutterSliderTrackBar(
                          inactiveTrackBar: BoxDecoration(
                            color: AppColors.backgroundDefaultInput,
                          ),
                          activeTrackBar: BoxDecoration(
                            color: AppColors.typePsychic,
                          ),
                        ),
                        tooltip: FlutterSliderTooltip(
                          alwaysShowTooltip: true,
                          positionOffset: FlutterSliderTooltipPositionOffset(
                            top: 50,
                          ),
                          custom: (value) {
                            return Text(
                              value.round().toString(),
                              style: AppTextStyles.rangeSliderText,
                            );
                          },
                        ),
                        onDragCompleted: (
                          handlerIndex,
                          lowerValue,
                          upperValue,
                        ) {
                          filterTabBloc.add(
                            ChangeRangeEvent(
                              newRange: [lowerValue, upperValue],
                            ),
                          );
                        },
                      ),
                    )
                  : Container(),
              Padding(
                padding: EdgeInsets.only(
                  right: 40,
                  top: 50,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TabButton(
                        onPressed: () {
                          filterTabBloc.add(
                            ResetEvent(),
                          );
                          homeBloc.add(
                            FilterListEvent(
                              types: [],
                              weakenesses: [],
                              heights: [],
                              weights: [],
                              range: [],
                            ),
                          );
                        },
                        text: "Reset",
                        isSelcted: false,
                      ),
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    Expanded(
                      child: TabButton(
                        onPressed: () {
                          homeBloc.add(
                            FilterListEvent(
                              types: state.types,
                              weakenesses: state.weaknesses,
                              heights: state.heights,
                              weights: state.weights,
                              range: state.range,
                            ),
                          );
                        },
                        text: "Apply",
                        isSelcted: true,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
