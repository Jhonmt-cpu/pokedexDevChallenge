import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_dev_challenge/pages/home/domain/models/pokemons_generation.dart';
import 'package:pokedex_dev_challenge/pages/home/infra/repositories/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeListLoadingState());

  HomeRepository _homeRepository = GetIt.instance<HomeRepository>();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is FetchHomeListEvent) {
      var fetchedList =
          await _homeRepository.getPokemonsByGeneration(event.generationId);

      yield fetchedList.fold(
        (l) => HomeListErrorState(),
        (pokemonList) => HomeListLoadedState(pokemonList: pokemonList),
      );
    }
  }
}
