import 'package:get/get.dart';
import 'package:pokedex_dev_challenge/ui/home/models/pokemons_generations.dart';
import 'package:pokedex_dev_challenge/ui/home/repositories/home_repository.dart';

class HomeController extends GetxController {
  final _homeRepository = Get.find<HomeRepository>();

  var originalList = <PokemonV2Pokemonspecies>[];

  var pokemonList = <PokemonV2Pokemonspecies>[].obs;

  var inputFocused = false.obs;

  var inputValue = "".obs;

  var generation = 1.obs;

  var sortType = 1.obs;

  @override
  void onInit() {
    super.onInit();
    ever(inputValue, (_) => _filterAll(originalList));
    ever(sortType, (_) => _filterAll(originalList));
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

    fetchedList.fold((l) => throw Exception("implemnt error"),
        (pokemonGeneration) {
      originalList.clear();
      originalList.addAll(pokemonGeneration.pokemonV2Pokemonspecies);
      _filterAll(pokemonGeneration.pokemonV2Pokemonspecies);
    });
  }

  void _filterAll(List<PokemonV2Pokemonspecies> list) {
    var listFilteredByInput = _filterListByInput(list);
    var listSorted = _sortList(listFilteredByInput);
    pokemonList.clear();
    pokemonList.addAll(listSorted);
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
        list = list
            .where((element) => element.name.contains(valueParsed))
            .toList();
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
}
