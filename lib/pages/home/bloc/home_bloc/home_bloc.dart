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

  List<String> filterTypes = [];

  List<String> filterWeakenesses = [];

  List<String> filterHeights = [];

  List<String> filterWeights = [];

  List<double> filterRange = [];

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
          _filterAll();
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
        _filterAll();
        yield HomeListLoadedState(pokemonList: pokemonListFiltered!);
      }
    }

    if (event is SortListEvent) {
      this.sortType = event.sortType;
      if (pokemonListFiltered != null) {
        _filterAll();
        yield HomeListLoadedState(pokemonList: pokemonListFiltered!);
      }
    }

    if (event is FilterListEvent) {
      this.filterTypes = event.types;
      this.filterWeakenesses = event.weakenesses;
      this.filterHeights = event.heights;
      this.filterWeights = event.weights;
      this.filterRange = event.range;
      if (pokemonListFiltered != null) {
        _filterAll();
        yield HomeListLoadedState(pokemonList: pokemonListFiltered!);
      }
    }
  }

  _filterAll() {
    var list = _filterList();
    _filterListByInput(list);
    _sortList();
  }

  void _filterListByInput(List<PokemonV2Pokemonspecies> list) {
    int? valueNumber = int.tryParse(this.inputValue);

    if (valueNumber != null) {
      pokemonListFiltered =
          list.where((element) => element.id == valueNumber).toList();
    } else {
      String valueParsed = this.inputValue.trim().toLowerCase();

      if (valueParsed != "") {
        pokemonListFiltered = list
            .where((element) => element.name.contains(valueParsed))
            .toList();
      } else {
        pokemonListFiltered = list;
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

  List<PokemonV2Pokemonspecies> _filterList() {
    List<PokemonV2Pokemonspecies> newPokemonListFiltered = pokemonList!;

    if (filterTypes.isNotEmpty && filterTypes.length < 18) {
      newPokemonListFiltered = newPokemonListFiltered.where(
        (element) {
          List<String> pokemonTypes = element
              .pokemonV2Pokemons[0].pokemonV2Pokemontypes
              .map((e) => e.pokemonV2Type.name)
              .toList();

          return filterTypes.any((type) => pokemonTypes.contains(type));
        },
      ).toList();
    }

    if (filterWeakenesses.isNotEmpty && filterWeakenesses.length < 18) {
      newPokemonListFiltered = newPokemonListFiltered.where(
        (element) {
          List<String> pokemonWeakenesses = element.weaknesses;

          return filterWeakenesses
              .any((weakness) => pokemonWeakenesses.contains(weakness));
        },
      ).toList();
    }

    if (filterHeights.isNotEmpty && filterHeights.length < 3) {
      newPokemonListFiltered = newPokemonListFiltered.where((element) {
        int pokemonHeight = element.pokemonV2Pokemons[0].height;
        String pokemonHeightType = pokemonHeight <= 10
            ? "short"
            : pokemonHeight <= 20
                ? "medium"
                : "tall";

        return filterHeights.contains(pokemonHeightType);
      }).toList();
    }

    if (filterWeights.isNotEmpty && filterWeights.length < 3) {
      newPokemonListFiltered = newPokemonListFiltered.where((element) {
        int pokemonWeight = element.pokemonV2Pokemons[0].weight;
        String pokemonWeightType = pokemonWeight <= 250
            ? "light"
            : pokemonWeight <= 1000
                ? "normal"
                : "heavy";

        return filterWeights.contains(pokemonWeightType);
      }).toList();
    }

    if (filterRange.isNotEmpty) {
      newPokemonListFiltered = newPokemonListFiltered.where((element) {
        return element.id >= filterRange[0] && element.id <= filterRange[1];
      }).toList();
    }

    return newPokemonListFiltered;
  }
}
