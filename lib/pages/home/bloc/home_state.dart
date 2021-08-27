part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeListLoadingState extends HomeState {}

class HomeListLoadedState extends HomeState {
  final PokemonsGeneration pokemonList;

  HomeListLoadedState({required this.pokemonList});
}

class HomeListErrorState extends HomeState {}
