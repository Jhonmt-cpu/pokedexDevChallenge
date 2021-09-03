import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'generation_tab_event.dart';
part 'generation_tab_state.dart';

class GenerationTabBloc extends Bloc<GenerationTabEvent, GenerationTabState> {
  GenerationTabBloc() : super(GeneraionTabSelected(generationIdSelected: 1));

  int generationId = 1;

  @override
  Stream<GenerationTabState> mapEventToState(
    GenerationTabEvent event,
  ) async* {
    if (event is ChangeGeneration) {
      generationId = event.generationIdSelected;
      yield GeneraionTabSelected(
        generationIdSelected: generationId,
      );
    }
  }
}
