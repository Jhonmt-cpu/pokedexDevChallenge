import 'dart:async';
import 'dart:developer';

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

  List<PokemonV2Pokemonspecies>? pokemonList;

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is FetchHomeListEvent) {
      var fetchedList =
          await _homeRepository.getPokemonsByGeneration(event.generationId);

      yield fetchedList.fold((l) => HomeListErrorState(), (pokemonGeneration) {
        this.pokemonList = pokemonGeneration.pokemonV2Pokemonspecies;
        return HomeListLoadedState(
          pokemonList: pokemonGeneration.pokemonV2Pokemonspecies!,
        );
      });
    }

    if (event is FilterListByInputEvent) {
      int? valueNumber = int.tryParse(event.value);

      if (valueNumber != null && pokemonList != null) {
        List<PokemonV2Pokemonspecies> pokemonListFiltered =
            pokemonList!.where((element) => element.id == valueNumber).toList();
        yield HomeListLoadedState(pokemonList: pokemonListFiltered);
      } else if (pokemonList != null) {
        String valueParsed = event.value.trim().toLowerCase();

        if (valueParsed != "") {
          List<PokemonV2Pokemonspecies> pokemonListFiltered = pokemonList!
              .where((element) => element.name!.contains(valueParsed))
              .toList();
          yield HomeListLoadedState(pokemonList: pokemonListFiltered);
        } else {
          yield HomeListLoadedState(pokemonList: pokemonList!);
        }
      }
    }
  }
}
