part of 'pokemon_tab_bloc.dart';

abstract class PokemonTabEvent extends Equatable {
  const PokemonTabEvent();

  @override
  List<Object> get props => [];
}

class ChangePokemonTab extends PokemonTabEvent {
  final int tabId;

  ChangePokemonTab({required this.tabId});

  @override
  List<Object> get props => [tabId];
}
