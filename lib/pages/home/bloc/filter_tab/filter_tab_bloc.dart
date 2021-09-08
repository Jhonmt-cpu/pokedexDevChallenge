import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex_dev_challenge/pages/home/bloc/home_bloc/home_bloc.dart';
import 'package:pokedex_dev_challenge/pages/home/domain/models/pokemons_generation.dart';

part 'filter_tab_event.dart';
part 'filter_tab_state.dart';

class FilterTabBloc extends Bloc<FilterTabEvent, FilterTabState> {
  List<String> types = [];
  List<String> weaknesses = [];
  List<String> heights = [];
  List<String> weights = [];
  static List<double> range = [1, 151];
  static int? minRangeNumber = 1;
  static int? maxRangeNumber = 151;

  FilterTabBloc()
      : super(
          FilterTabItensSelected(
            types: [],
            weaknesses: [],
            heights: [],
            weights: [],
            minRangeNumber: 1,
            maxRangeNumber: 151,
            range: [1, 151],
          ),
        );

  @override
  Stream<FilterTabState> mapEventToState(
    FilterTabEvent event,
  ) async* {
    if (event is ChangeTypesEvent) {
      if (event.shouldAdd) {
        types = List.of(types)..add(event.type);
      } else {
        types = types.where((element) => element != event.type).toList();
      }

      yield FilterTabItensSelected(
        types: types,
        weaknesses: weaknesses,
        heights: heights,
        weights: weights,
        minRangeNumber: minRangeNumber,
        maxRangeNumber: maxRangeNumber,
        range: range,
      );
    }
    if (event is ChangeWeaknessesEvent) {
      if (event.shouldAdd) {
        weaknesses = List.of(weaknesses)..add(event.weakness);
      } else {
        weaknesses =
            weaknesses.where((element) => element != event.weakness).toList();
      }

      yield FilterTabItensSelected(
        types: types,
        weaknesses: weaknesses,
        heights: heights,
        weights: weights,
        minRangeNumber: minRangeNumber,
        maxRangeNumber: maxRangeNumber,
        range: range,
      );
    }
    if (event is ChangeHeightsEvent) {
      if (event.shouldAdd) {
        heights = List.of(heights)..add(event.height);
      } else {
        heights = heights.where((element) => element != event.height).toList();
      }

      yield FilterTabItensSelected(
        types: types,
        weaknesses: weaknesses,
        heights: heights,
        weights: weights,
        minRangeNumber: minRangeNumber,
        maxRangeNumber: maxRangeNumber,
        range: range,
      );
    }
    if (event is ChangeWeightsEvent) {
      if (event.shouldAdd) {
        weights = List.of(weights)..add(event.weight);
      } else {
        weights = weights.where((element) => element != event.weight).toList();
      }

      yield FilterTabItensSelected(
        types: types,
        weaknesses: weaknesses,
        heights: heights,
        weights: weights,
        minRangeNumber: minRangeNumber,
        maxRangeNumber: maxRangeNumber,
        range: range,
      );
    }
    if (event is ChangeRangeEvent) {
      range = event.newRange;
      yield FilterTabItensSelected(
        types: types,
        weaknesses: weaknesses,
        heights: heights,
        weights: weights,
        minRangeNumber: minRangeNumber,
        maxRangeNumber: maxRangeNumber,
        range: range,
      );
    }
    if (event is ResetEvent) {
      List<PokemonV2Pokemonspecies>? pokemonList = HomeBloc.pokemonList;

      int? newMinRangeNumber = pokemonList?[0].id;
      int? newMaxRangeNumber = pokemonList?[pokemonList.length - 1].id;

      List<double> newRange = [];

      if (newMinRangeNumber != null && maxRangeNumber != null) {
        newRange = [
          newMinRangeNumber.toDouble(),
          newMaxRangeNumber!.toDouble()
        ];
      }

      types = [];
      weaknesses = [];
      heights = [];
      weights = [];
      range = newRange;
      minRangeNumber = newMinRangeNumber;
      maxRangeNumber = newMaxRangeNumber;

      yield FilterTabItensSelected(
        types: types,
        weaknesses: weaknesses,
        heights: heights,
        weights: weights,
        minRangeNumber: minRangeNumber,
        maxRangeNumber: maxRangeNumber,
        range: range,
      );
    }
  }
}
