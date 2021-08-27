import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_dev_challenge/core/styles/app_colors.dart';
import 'package:pokedex_dev_challenge/core/core.dart';
import 'package:pokedex_dev_challenge/core/widgets/GradientIcon.dart';
import 'package:pokedex_dev_challenge/pages/home/bloc/home_bloc.dart';
import 'package:pokedex_dev_challenge/pages/home/infra/repositories/home_repository.dart';
import 'package:pokedex_dev_challenge/pages/home/presentation/widgets/pokemon_item.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeRepository homeRepository = GetIt.instance<HomeRepository>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double statusHeight = MediaQuery.of(context).padding.top;
    double navBarHeight = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
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
                        log("Clicou geração");
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
                  child: FocusScope(
                    child: Focus(
                      onFocusChange: (focus) => log("focus: $focus"),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "What Pokémon are you looking for?",
                          hintStyle: AppTextStyles.description,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: AppColors.backgroundDefaultInput,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: AppColors.backgroundDefaultInput,
                            ),
                          ),
                          filled: true,
                          fillColor: AppColors.backgroundDefaultInput,
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
                  ),
                ),
                Expanded(
                  child: BlocBuilder<HomeBloc, HomeState>(
                      bloc: BlocProvider.of<HomeBloc>(context),
                      builder: (context, state) {
                        if (state is HomeListLoadedState) {
                          return ListView.builder(
                            padding: EdgeInsets.only(
                              top: 0,
                              bottom: navBarHeight,
                            ),
                            physics: BouncingScrollPhysics(),
                            itemCount: state
                                .pokemonList.pokemonV2Pokemonspecies!.length,
                            itemBuilder: (context, index) {
                              return PokemonItem(
                                pokemon: state.pokemonList
                                    .pokemonV2Pokemonspecies![index],
                              );
                            },
                          );
                        }

                        if (state is HomeListErrorState) {
                          return Center(
                            child: Text(
                              "Falha ao carregar a Lista",
                            ),
                          );
                        }

                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                  // child: ListView.builder(
                  //   padding: EdgeInsets.only(
                  //     top: 0,
                  //     bottom: navBarHeight,
                  //   ),
                  //   physics: BouncingScrollPhysics(),
                  //   itemCount: 10,
                  //   itemBuilder: (context, index) {
                  //     return PokemonItem();
                  //   },
                  // ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
