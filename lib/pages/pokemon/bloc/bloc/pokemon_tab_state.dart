part of 'pokemon_tab_bloc.dart';

abstract class PokemonTabState extends Equatable {
  const PokemonTabState();

  @override
  List<Object> get props => [];
}

class PokemonTabSelected extends PokemonTabState {
  final int tabIndex;

  PokemonTabSelected({required this.tabIndex});

  @override
  List<Object> get props => [tabIndex];
}
