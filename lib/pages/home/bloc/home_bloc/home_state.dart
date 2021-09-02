part of 'home_bloc.dart';

abstract class HomeState {
  const HomeState();
}

class HomeListLoadingState extends HomeState {}

class HomeListLoadedState extends HomeState {
  final List<PokemonV2Pokemonspecies> pokemonList;

  HomeListLoadedState({required this.pokemonList});
}

class HomeListErrorState extends HomeState {}
