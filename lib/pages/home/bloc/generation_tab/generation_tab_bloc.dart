import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'generation_tab_event.dart';
part 'generation_tab_state.dart';

class GenerationTabBloc extends Bloc<GenerationTabEvent, GenerationTabState> {
  GenerationTabBloc() : super(GenerationTabInitial());

  @override
  Stream<GenerationTabState> mapEventToState(
    GenerationTabEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
