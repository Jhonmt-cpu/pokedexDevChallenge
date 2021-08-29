part of 'input_bloc.dart';

abstract class InputEvent extends Equatable {
  const InputEvent();

  @override
  List<Object> get props => [];
}

class InputFocusChange extends InputEvent {
  final bool isFocused;

  InputFocusChange({required this.isFocused});
}
