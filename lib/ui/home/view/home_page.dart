import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pokedex_dev_challenge/app/components/gradient_icon.dart';
import 'package:pokedex_dev_challenge/app/helpers/assets/app_images.dart';
import 'package:pokedex_dev_challenge/app/helpers/styles/app_colors.dart';
import 'package:pokedex_dev_challenge/app/helpers/styles/app_gradients.dart';
import 'package:pokedex_dev_challenge/app/helpers/styles/app_text_styles.dart';
import 'package:pokedex_dev_challenge/app/helpers/values/strings.dart';
import 'package:pokedex_dev_challenge/app/utils/open_sliding_sheet.dart';
import 'package:pokedex_dev_challenge/ui/home/components/pokemon_item.dart';
import 'package:pokedex_dev_challenge/ui/home/components/tabs/generation_tab.dart';
import 'package:pokedex_dev_challenge/ui/home/components/tabs/sort_tab.dart';
import 'package:pokedex_dev_challenge/ui/home/controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  var screenHeight = Get.height;
  var screenWidth = Get.width;
  var statusBarHeight = Get.statusBarHeight;
  var navBarHeight = Get.bottomBarHeight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: -(screenWidth / 2),
            child: GradientIcon(
              icon: AppImages.pokeball,
              size: screenWidth,
              gradient: AppGradients.gradientPokeball,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 40,
              right: 40,
              left: 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        openSlidingSheet(
                          context,
                          Obx(() {
                            return GenerationTab(
                              generationId: controller.generation.value,
                              changeGeneration: (generationId) {
                                controller.fetchPokemonList(generationId);
                              },
                            );
                          }),
                        );
                      },
                      behavior: HitTestBehavior.opaque,
                      child: SvgPicture.asset(
                        AppImages.generation,
                        color: AppColors.textBlack,
                        width: 25,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        openSlidingSheet(
                          context,
                          Obx(() {
                            return SortTab(
                              sortTypeId: controller.sortType.value,
                              // changeGeneration: (generationId) {
                              //   controller.fetchPokemonList(generationId);
                              // },
                            );
                          }),
                        );
                      },
                      child: SvgPicture.asset(
                        AppImages.sort,
                        color: AppColors.textBlack,
                        width: 25,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        //Todo open slidingsheet wit filter tab
                      },
                      child: SvgPicture.asset(
                        AppImages.filter,
                        color: AppColors.textBlack,
                        width: 25,
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 35,
                    bottom: 10,
                  ),
                  child: Text(
                    Strings.homeTitle,
                    style: AppTextStyles.applicationTitle,
                  ),
                ),
                const Text(
                  Strings.homeSearchInfo,
                  style: AppTextStyles.description,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 25,
                    bottom: 20,
                  ),
                  child: Obx(() {
                    return FocusScope(
                      child: Focus(
                        onFocusChange: (focus) {
                          controller.inputFocused.value = focus;
                        },
                        child: TextField(
                          onChanged: (value) {
                            controller.inputValue.value = value;
                          },
                          cursorColor: AppColors.typePsychic,
                          decoration: InputDecoration(
                            hintText: Strings.homeInputPlaceholder,
                            hintStyle: AppTextStyles.description,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: controller.inputFocused.value
                                ? AppColors.backgroundPressedInput
                                : AppColors.backgroundDefaultInput,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                                bottom: 20,
                                left: 20,
                                right: 10,
                              ),
                              child: SvgPicture.asset(
                                AppImages.search,
                                width: 20,
                                color: AppColors.textGray,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                Expanded(
                  child: AnimationLimiter(
                    child: Obx(() {
                      if (controller.pokemonListFiltred.isNotEmpty) {
                        return ListView.builder(
                          padding: EdgeInsets.only(
                            top: 0,
                            bottom: navBarHeight,
                          ),
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.pokemonListFiltred.length,
                          itemBuilder: (context, index) {
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              child: ScaleAnimation(
                                child: FadeInAnimation(
                                  child: PokemonItem(
                                    pokemon:
                                        controller.pokemonListFiltred[index],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
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
