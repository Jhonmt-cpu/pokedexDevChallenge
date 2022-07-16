import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_dev_challenge/ui/home/models/pokemons_generations.dart';
import 'package:pokedex_dev_challenge/ui/home/repositories/home_repository.dart';

class HomeController extends GetxController {
  final _homeRepository = Get.find<HomeRepository>();

  var originalList = <PokemonV2Pokemonspecies>[];

  var pokemonList = <PokemonV2Pokemonspecies>[].obs;

  var inputFocused = false.obs;

  var inputValue = "".obs;

  var inputTextController = TextEditingController();

  var generation = 1.obs;

  var sortType = 1.obs;

  var filterTypes = <String>{}.obs;
  var filterWeaknesses = <String>{}.obs;
  var filterHeights = <String>{}.obs;
  var filterWeights = <String>{}.obs;
  var filterRange = <double>[1, 151].obs;
  var minRangeNumber = 1.obs;
  var maxRangeNumber = 151.obs;

  @override
  void onInit() {
    super.onInit();
    ever(inputValue, (_) => filterAll());
    ever(sortType, (_) => filterAll());
    fetchPokemonList(1);
  }

  fetchPokemonList(int? generationId) async {
    pokemonList.value = [];
    if (generationId != null) {
      generation.value = generationId;
    }

    var fetchedList = await _homeRepository.getPokemonsByGeneration(
      generation.value,
    );

    fetchedList.fold((l) => throw Exception("implemnt error"), (pokemonGeneration) {
      originalList.clear();
      originalList.addAll(pokemonGeneration.pokemonV2Pokemonspecies);
      resetAfterGet();
    });
  }

  void filterAll() {
    var listFilteredByInput = _filterListByInput(originalList);
    var listSorted = _sortList(listFilteredByInput);
    var listFiltered = _filterList(listSorted);
    pokemonList.clear();
    pokemonList.addAll(listFiltered);
  }

  List<PokemonV2Pokemonspecies> _filterListByInput(
    List<PokemonV2Pokemonspecies> list,
  ) {
    int? valueNumber = int.tryParse(inputValue.value);

    if (valueNumber != null) {
      list = list.where((element) => element.id == valueNumber).toList();
    } else {
      String valueParsed = inputValue.trim().toLowerCase();

      if (valueParsed != "") {
        list = list.where((element) => element.name.contains(valueParsed)).toList();
      }
    }

    return list;
  }

  List<PokemonV2Pokemonspecies> _sortList(
    List<PokemonV2Pokemonspecies> list,
  ) {
    switch (sortType.value) {
      case 1:
        list.sort((a, b) => a.id.compareTo(b.id));
        break;
      case 2:
        list.sort((a, b) => b.id.compareTo(a.id));
        break;
      case 3:
        list.sort((a, b) => a.name.compareTo(b.name));
        break;
      default:
        list.sort((a, b) => b.name.compareTo(a.name));
    }

    return list;
  }

  List<PokemonV2Pokemonspecies> _filterList(
    List<PokemonV2Pokemonspecies> list,
  ) {
    if (filterTypes.isNotEmpty && filterTypes.length < 18) {
      list = list.where(
        (element) {
          List<String> pokemonTypes = element.pokemonV2Pokemons[0].pokemonV2Pokemontypes
              .map((e) => e.pokemonV2Type.name)
              .toList();

          return filterTypes.any((type) => pokemonTypes.contains(type));
        },
      ).toList();
    }

    if (filterWeaknesses.isNotEmpty && filterWeaknesses.length < 18) {
      list = list.where(
        (element) {
          List<String> pokemonWeaknesses = element.weaknesses;

          return filterWeaknesses.any((weakness) => pokemonWeaknesses.contains(weakness));
        },
      ).toList();
    }

    if (filterHeights.isNotEmpty && filterHeights.length < 3) {
      list = list.where((element) {
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
      list = list.where((element) {
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
      list = list.where((element) {
        return element.id >= filterRange[0] && element.id <= filterRange[1];
      }).toList();
    }

    return list;
  }

  void addRemoveType({
    required String type,
    required bool shouldAdd,
  }) {
    if (shouldAdd) {
      filterTypes.add(type);
    } else {
      filterTypes.remove(type);
    }
  }

  void addRemoveWeaknesses({
    required String weakness,
    required bool shouldAdd,
  }) {
    if (shouldAdd) {
      filterWeaknesses.add(weakness);
    } else {
      filterWeaknesses.remove(weakness);
    }
  }

  void addRemoveHeight({
    required String height,
    required bool shouldAdd,
  }) {
    if (shouldAdd) {
      filterHeights.add(height);
    } else {
      filterHeights.remove(height);
    }
  }

  void addRemoveWeight({
    required String weight,
    required bool shouldAdd,
  }) {
    if (shouldAdd) {
      filterWeights.add(weight);
    } else {
      filterWeights.remove(weight);
    }
  }

  void resetFilters() {
    filterTypes.clear();
    filterWeaknesses.clear();
    filterHeights.clear();
    filterWeights.clear();
    filterRange.value = [minRangeNumber.value.toDouble(), maxRangeNumber.value.toDouble()];

    filterAll();
  }

  void resetAfterGet() {
    inputTextController.text = '';
    inputValue.value = '';
    minRangeNumber.value = originalList[0].id;
    maxRangeNumber.value = originalList[originalList.length - 1].id;

    resetFilters();
  }
}
