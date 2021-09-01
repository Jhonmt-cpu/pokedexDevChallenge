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

  List<PokemonV2Pokemonspecies>? pokemonList;

  List<PokemonV2Pokemonspecies>? pokemonListFiltered;

  int generation = 1;

  int sortType = 1;

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is FetchHomeListEvent) {
      yield HomeListLoadingState();
      this.pokemonList = null;
      this.pokemonListFiltered = null;
      if (event.generationId != null) {
        this.generation = event.generationId!;
      }
      var fetchedList =
          await _homeRepository.getPokemonsByGeneration(generation);

      yield fetchedList.fold((l) => HomeListErrorState(), (pokemonGeneration) {
        this.pokemonListFiltered =
            this.pokemonList = pokemonGeneration.pokemonV2Pokemonspecies;
        if (this.pokemonListFiltered != null) {
          _sortList();
          return HomeListLoadedState(
            pokemonList: pokemonListFiltered!,
          );
        }
        return HomeListErrorState();
      });
    }

    if (event is FilterListByInputEvent) {
      int? valueNumber = int.tryParse(event.value);

      if (valueNumber != null && pokemonListFiltered != null) {
        List<PokemonV2Pokemonspecies> pokemonListFilteredByInput =
            pokemonListFiltered!
                .where((element) => element.id == valueNumber)
                .toList();
        yield HomeListLoadedState(pokemonList: pokemonListFilteredByInput);
      } else if (pokemonList != null) {
        String valueParsed = event.value.trim().toLowerCase();

        if (valueParsed != "") {
          List<PokemonV2Pokemonspecies> pokemonListFilteredByInput =
              pokemonListFiltered!
                  .where((element) => element.name.contains(valueParsed))
                  .toList();
          yield HomeListLoadedState(pokemonList: pokemonListFilteredByInput);
        } else {
          yield HomeListLoadedState(pokemonList: pokemonListFiltered!);
        }
      }
    }

    if (event is SortListEvent) {
      this.sortType = event.sortType;
      _sortList();
      List<PokemonV2Pokemonspecies> listSorted = [];
      pokemonListFiltered!.forEach((element) {
        listSorted.add(PokemonV2Pokemonspecies(
          name: element.name,
          id: element.id,
          pokemonV2Pokemons: element.pokemonV2Pokemons,
        ));
      });

      yield HomeListLoadedState(pokemonList: listSorted);
    }
  }

  void _sortList() {
    switch (sortType) {
      case 1:
        pokemonListFiltered!.sort((a, b) => a.id.compareTo(b.id));
        break;
      case 2:
        pokemonListFiltered!.sort((a, b) => b.id.compareTo(a.id));
        break;
      case 3:
        pokemonListFiltered!.sort((a, b) => a.name.compareTo(b.name));
        break;
      default:
        pokemonListFiltered!.sort((a, b) => b.name.compareTo(a.name));
    }
  }
}
