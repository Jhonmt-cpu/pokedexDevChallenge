import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pokemon_tab_event.dart';
part 'pokemon_tab_state.dart';

class PokemonTabBloc extends Bloc<PokemonTabEvent, PokemonTabState> {
  PokemonTabBloc() : super(PokemonTabSelected(tabIndex: 0));

  @override
  Stream<PokemonTabState> mapEventToState(PokemonTabEvent event) async* {
    event as ChangePokemonTab;

    yield PokemonTabSelected(tabIndex: event.tabId);
  }
}
