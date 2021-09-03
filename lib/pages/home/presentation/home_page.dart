import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_dev_challenge/pages/home/bloc/filter_tab/filter_tab_bloc.dart';
import 'package:pokedex_dev_challenge/pages/home/presentation/widgets/sliding_sheet_tabs/filter_tab.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/core.dart';
import '../../../core/widgets/gradient_icon.dart';
import '../bloc/generation_tab/generation_tab_bloc.dart';
import '../bloc/home_bloc/home_bloc.dart';
import '../bloc/input_bloc/input_bloc.dart';
import '../bloc/sliding_sheet/sliding_sheet_bloc.dart';
import '../bloc/sort_tab/sort_tab_bloc.dart';
import '../infra/repositories/home_repository.dart';
import '../presentation/widgets/pokemon_item.dart';
import '../presentation/widgets/sliding_sheet_tabs/generation_tab.dart';
import '../presentation/widgets/sliding_sheet_tabs/sort_tab.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeRepository homeRepository = GetIt.instance<HomeRepository>();

  @override
  Widget build(BuildContext context) {
    InputBloc inputBloc = BlocProvider.of<InputBloc>(context);
    HomeBloc homeBloc = BlocProvider.of<HomeBloc>(context);
    SlidingSheetBloc slidingSheetBloc =
        BlocProvider.of<SlidingSheetBloc>(context);
    GenerationTabBloc generationTabBloc =
        BlocProvider.of<GenerationTabBloc>(context);
    SortTabBloc sortTabBloc = BlocProvider.of<SortTabBloc>(context);
    FilterTabBloc filterTabBloc = BlocProvider.of<FilterTabBloc>(context);

    double screenWidth = MediaQuery.of(context).size.width;
    double statusHeight = MediaQuery.of(context).padding.top;
    double navBarHeight = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      resizeToAvoidBottomInset: false,
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: MediaQuery.of(context).padding.top -
                (screenWidth / 2) -
                statusHeight,
            child: GradientIcon(
              gradient: AppGradients.gradientPokeball,
              icon: AppImages.pokeball,
              size: screenWidth,
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
                        slidingSheetBloc.add(
                          OpenSlidingSheetEvent(
                            context: context,
                            page: GenerationTab(
                              generationTabBloc: generationTabBloc,
                              homeBloc: homeBloc,
                            ),
                          ),
                        );
                      },
                      behavior: HitTestBehavior.opaque,
                      child: SvgPicture.asset(
                        AppImages.generation,
                        color: AppColors.textBlack,
                        width: 25,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        slidingSheetBloc.add(
                          OpenSlidingSheetEvent(
                            context: context,
                            page: SortTab(
                              homeBloc: homeBloc,
                              sortTabBloc: sortTabBloc,
                            ),
                          ),
                        );
                      },
                      child: SvgPicture.asset(
                        AppImages.sort,
                        color: AppColors.textBlack,
                        width: 25,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        slidingSheetBloc.add(
                          OpenSlidingSheetEvent(
                            context: context,
                            page: FilterTab(
                              homeBloc: homeBloc,
                              filterTabBloc: filterTabBloc,
                            ),
                          ),
                        );
                      },
                      child: SvgPicture.asset(
                        AppImages.filter,
                        color: AppColors.textBlack,
                        width: 25,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 35,
                    bottom: 10,
                  ),
                  child: Text(
                    "Pokédex",
                    style: AppTextStyles.applicationTitle,
                  ),
                ),
                Text(
                  "Search fo Pokémon by name or using the National Pokédex number.",
                  style: AppTextStyles.description,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 25,
                    bottom: 20,
                  ),
                  child: BlocBuilder<InputBloc, InputState>(
                    bloc: inputBloc,
                    builder: (context, state) {
                      Color inputBackgroundColor;
                      if (state is InputUnfocused) {
                        inputBackgroundColor = AppColors.backgroundDefaultInput;
                      } else {
                        inputBackgroundColor = AppColors.backgroundPressedInput;
                      }

                      return FocusScope(
                        child: Focus(
                          onFocusChange: (focus) {
                            inputBloc.add(InputFocusChange(isFocused: focus));
                          },
                          child: TextField(
                            onChanged: (value) {
                              homeBloc.add(
                                FilterListByInputEvent(value: value),
                              );
                            },
                            cursorColor: AppColors.typePsychic,
                            decoration: InputDecoration(
                              hintText: "What Pokémon are you looking for?",
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
                              fillColor: inputBackgroundColor,
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
                    },
                  ),
                ),
                Expanded(
                  child: BlocBuilder<HomeBloc, HomeState>(
                      bloc: homeBloc,
                      builder: (context, state) {
                        if (state is HomeListLoadedState) {
                          return AnimationLimiter(
                            child: ListView.builder(
                              padding: EdgeInsets.only(
                                top: 0,
                                bottom: navBarHeight,
                              ),
                              physics: BouncingScrollPhysics(),
                              itemCount: state.pokemonList.length,
                              itemBuilder: (context, index) {
                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 500),
                                  child: ScaleAnimation(
                                    child: FadeInAnimation(
                                      child: PokemonItem(
                                        pokemon: state.pokemonList[index],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }

                        if (state is HomeListErrorState) {
                          return GestureDetector(
                            onTap: () {
                              homeBloc.add(FetchHomeListEvent());
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 100,
                                ),
                                Text(
                                  "Ops!, it seems an error ocourred while getting your list, tap to try again.",
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.errorList,
                                ),
                                SizedBox(
                                  height: 45,
                                ),
                                SvgPicture.asset(
                                  AppImages.noConnection,
                                  height: 100,
                                  width: 100,
                                  color: AppColors.textGray,
                                )
                              ],
                            ),
                          );
                        }

                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
