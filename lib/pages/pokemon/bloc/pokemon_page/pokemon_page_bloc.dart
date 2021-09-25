import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pokemon_page_event.dart';
part 'pokemon_page_state.dart';

class PokemonPageBloc extends Bloc<PokemonPageEvent, PokemonPageState> {
  PokemonPageBloc()
      : super(PokemonPageLoaded(
          pokemonBackNameOpacity: 1,
          pokemonItemOpacity: 1,
          progress: 0,
          reversedProgress: 1,
        ));

  @override
  Stream<PokemonPageState> mapEventToState(PokemonPageEvent event) async* {
    if (event is SligingSheetScroolPokemonPage) {
      var reversedProgress = 1 - event.progress;
      var pokemonBackNameOpacity = 1 - _interval(0.0, 0.87, event.progress);
      var pokemonItemOpacity = 1 - _interval(0, 0.2, event.progress);
      yield PokemonPageLoaded(
        progress: event.progress,
        reversedProgress: reversedProgress,
        pokemonBackNameOpacity: pokemonBackNameOpacity,
        pokemonItemOpacity: pokemonItemOpacity,
      );
    }
  }
}

double _interval(double lower, double upper, double progress) {
  assert(lower < upper);

  if (progress > upper) return 1.0;
  if (progress < lower) return 0.0;

  return ((progress - lower) / (upper - lower)).clamp(0.0, 1.0);
}
