part of 'pokemon_page_bloc.dart';

abstract class PokemonPageEvent extends Equatable {
  const PokemonPageEvent();

  @override
  List<Object> get props => [];
}

class SligingSheetScroolPokemonPage extends PokemonPageEvent {
  final double progress;

  SligingSheetScroolPokemonPage({required this.progress});

  List<Object> get props => [progress];
}
