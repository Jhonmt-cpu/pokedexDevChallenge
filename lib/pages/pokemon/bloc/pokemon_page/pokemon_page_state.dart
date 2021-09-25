part of 'pokemon_page_bloc.dart';

abstract class PokemonPageState extends Equatable {
  const PokemonPageState();

  @override
  List<Object> get props => [];
}

class PokemonPageInitial extends PokemonPageState {}

class PokemonPageLoaded extends PokemonPageState {
  final double progress;
  final double reversedProgress;
  final num pokemonBackNameOpacity;
  final num pokemonItemOpacity;

  PokemonPageLoaded({
    required this.progress,
    required this.reversedProgress,
    required this.pokemonBackNameOpacity,
    required this.pokemonItemOpacity,
  });

  List<Object> get props => [
        this.progress,
        this.reversedProgress,
        this.pokemonBackNameOpacity,
        this.pokemonItemOpacity,
      ];
}
