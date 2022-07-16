import 'package:another_xlider/another_xlider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pokedex_dev_challenge/app/helpers/assets/app_images.dart';
import 'package:pokedex_dev_challenge/app/helpers/styles/app_colors.dart';
import 'package:pokedex_dev_challenge/app/helpers/styles/app_text_styles.dart';
import 'package:pokedex_dev_challenge/app/helpers/values/pokemon_type_list.dart';
import 'package:pokedex_dev_challenge/ui/home/components/tabs/components/filter_type_badge.dart';
import 'package:pokedex_dev_challenge/ui/home/components/tabs/components/generic_filter_badge.dart';
import 'package:pokedex_dev_challenge/ui/home/components/tabs/components/tab_button.dart';
import 'package:pokedex_dev_challenge/ui/home/controller/home_controller.dart';

class FilterTab extends GetView<HomeController> {
  const FilterTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(
        top: 30,
        left: 40,
        bottom: 50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Filters",
            style: AppTextStyles.tabTitle,
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 5,
              bottom: 35,
            ),
            child: Text(
              "Use advanced search to explore Pokémon by\ntype, weakness, height and more!",
              style: AppTextStyles.description,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "Types",
              style: AppTextStyles.filterTitle,
            ),
          ),
          SizedBox(
            width: screenWidth - 40,
            height: 50,
            child: ListView.builder(
              padding: const EdgeInsets.only(right: 10),
              scrollDirection: Axis.horizontal,
              itemCount: PokemonTypeList.pokemonTypeList.length,
              itemBuilder: (context, index) {
                String type = PokemonTypeList.pokemonTypeList[index];

                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Obx(
                    () => GestureDetector(
                      onTap: () {
                        controller.addRemoveType(
                          type: type,
                          shouldAdd: !controller.filterTypes.contains(type),
                        );
                      },
                      child: FilterTypeBadge(
                        type: type,
                        isSelected: controller.filterTypes.contains(type),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "Weaknesses",
              style: AppTextStyles.filterTitle,
            ),
          ),
          SizedBox(
            width: screenWidth - 40,
            height: 50,
            child: ListView.builder(
              padding: const EdgeInsets.only(right: 10),
              scrollDirection: Axis.horizontal,
              itemCount: PokemonTypeList.pokemonTypeList.length,
              itemBuilder: (context, index) {
                String weakness = PokemonTypeList.pokemonTypeList[index];

                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Obx(
                    () => GestureDetector(
                      onTap: () {
                        controller.addRemoveWeaknesses(
                          weakness: weakness,
                          shouldAdd:
                              !controller.filterWeaknesses.contains(weakness),
                        );
                      },
                      child: FilterTypeBadge(
                        type: weakness,
                        isSelected:
                            controller.filterWeaknesses.contains(weakness),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "Heights",
              style: AppTextStyles.filterTitle,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: GestureDetector(
                  onTap: () {
                    controller.addRemoveHeight(
                      height: "short",
                      shouldAdd: !controller.filterHeights.contains("short"),
                    );
                  },
                  child: Obx(
                    () => GenericFilterBadge(
                      color: AppColors.short,
                      icon: AppImages.short,
                      isSelected: controller.filterHeights.contains("short"),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: GestureDetector(
                  onTap: () {
                    controller.addRemoveHeight(
                      height: "medium",
                      shouldAdd: !controller.filterHeights.contains("medium"),
                    );
                  },
                  child: Obx(
                    () => GenericFilterBadge(
                      color: AppColors.medium,
                      icon: AppImages.medium,
                      isSelected: controller.filterHeights.contains("medium"),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.addRemoveHeight(
                    height: "tall",
                    shouldAdd: !controller.filterHeights.contains("tall"),
                  );
                },
                child: Obx(
                  () => GenericFilterBadge(
                    color: AppColors.tall,
                    icon: AppImages.tall,
                    isSelected: controller.filterHeights.contains("tall"),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 35,
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "Weights",
              style: AppTextStyles.filterTitle,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: GestureDetector(
                  onTap: () {
                    controller.addRemoveWeight(
                      weight: "light",
                      shouldAdd: !controller.filterWeights.contains("light"),
                    );
                  },
                  child: Obx(
                    () => GenericFilterBadge(
                      color: AppColors.light,
                      icon: AppImages.light,
                      isSelected: controller.filterWeights.contains("light"),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: GestureDetector(
                  onTap: () {
                    controller.addRemoveWeight(
                      weight: "normal",
                      shouldAdd: !controller.filterWeights.contains("normal"),
                    );
                  },
                  child: Obx(
                    () => GenericFilterBadge(
                      color: AppColors.normal,
                      icon: AppImages.normalW,
                      isSelected: controller.filterWeights.contains("normal"),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.addRemoveWeight(
                    weight: "heavy",
                    shouldAdd: !controller.filterWeights.contains("heavy"),
                  );
                },
                child: Obx(
                  () => GenericFilterBadge(
                    color: AppColors.heavy,
                    icon: AppImages.heavy,
                    isSelected: controller.filterWeights.contains("heavy"),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 35,
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "Number Range",
              style: AppTextStyles.filterTitle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 40,
            ),
            child: Obx(
              () => FlutterSlider(
                values: controller.filterRange,
                rangeSlider: true,
                min: controller.minRangeNumber.value.toDouble(),
                max: controller.maxRangeNumber.value.toDouble(),
                handlerAnimation: const FlutterSliderHandlerAnimation(
                  scale: 1,
                ),
                handler: FlutterSliderHandler(
                  decoration: const BoxDecoration(),
                  child: Container(
                    height: 20,
                    width: 20,
                    padding: const EdgeInsets.all(5),
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
                  decoration: const BoxDecoration(),
                  child: Container(
                    height: 20,
                    width: 20,
                    padding: const EdgeInsets.all(5),
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
                trackBar: const FlutterSliderTrackBar(
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
                  controller.filterRange.value = [
                    lowerValue,
                    upperValue,
                  ];
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 40,
              top: 50,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TabButton(
                    onPressed: () {
                      controller.resetFilters();
                    },
                    text: "Reset",
                    isSelected: false,
                  ),
                ),
                const SizedBox(
                  width: 14,
                ),
                Expanded(
                  child: TabButton(
                    onPressed: () {
                      controller.filterAll();
                    },
                    text: "Apply",
                    isSelected: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
