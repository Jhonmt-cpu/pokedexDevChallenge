import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_dev_challenge/pages/home/bloc/filter_tab/filter_tab_bloc.dart';
import 'package:pokedex_dev_challenge/pages/home/domain/models/pokemons_generation.dart';
import 'package:pokedex_dev_challenge/pages/home/infra/repositories/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.filterTabBloc) : super(HomeListLoadingState());

  HomeRepository _homeRepository = GetIt.instance<HomeRepository>();

  final FilterTabBloc filterTabBloc;

  static List<PokemonV2Pokemonspecies>? pokemonList;

  List<PokemonV2Pokemonspecies>? pokemonListFiltered;

  String inputValue = "";

  int generation = 1;

  int sortType = 1;

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is FetchHomeListEvent) {
      yield HomeListLoadingState();
      pokemonList = null;
      this.pokemonListFiltered = null;
      if (event.generationId != null) {
        this.generation = event.generationId!;
      }
      var fetchedList =
          await _homeRepository.getPokemonsByGeneration(generation);

      yield fetchedList.fold((l) => HomeListErrorState(), (pokemonGeneration) {
        this.pokemonListFiltered =
            pokemonList = pokemonGeneration.pokemonV2Pokemonspecies;
        if (this.pokemonListFiltered != null) {
          filterTabBloc.add(ResetEvent());
          _filterList();
          return HomeListLoadedState(
            pokemonList: pokemonListFiltered!,
          );
        }
        return HomeListErrorState();
      });
    }

    if (event is FilterListByInputEvent) {
      this.inputValue = event.value;
      if (pokemonListFiltered != null) {
        _filterList();
        yield HomeListLoadedState(pokemonList: pokemonListFiltered!);
      }
    }

    if (event is SortListEvent) {
      this.sortType = event.sortType;
      if (pokemonListFiltered != null) {
        _sortList();
        yield HomeListLoadedState(pokemonList: pokemonListFiltered!);
      }
    }
  }

  void _filterList() {
    int? valueNumber = int.tryParse(this.inputValue);

    if (valueNumber != null) {
      pokemonListFiltered =
          pokemonList!.where((element) => element.id == valueNumber).toList();
      _sortList();
    } else {
      String valueParsed = this.inputValue.trim().toLowerCase();

      if (valueParsed != "") {
        pokemonListFiltered = pokemonList!
            .where((element) => element.name.contains(valueParsed))
            .toList();
        _sortList();
      } else {
        pokemonListFiltered = pokemonList!;
        _sortList();
      }
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
