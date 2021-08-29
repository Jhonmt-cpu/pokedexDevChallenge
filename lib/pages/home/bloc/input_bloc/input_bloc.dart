import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'input_event.dart';
part 'input_state.dart';

class InputBloc extends Bloc<InputEvent, InputState> {
  InputBloc() : super(InputUnfocused());

  @override
  Stream<InputState> mapEventToState(
    InputEvent event,
  ) async* {
    if (event is InputFocusChange) {
      yield event.isFocused ? InputFocused() : InputUnfocused();
    }
  }
}
