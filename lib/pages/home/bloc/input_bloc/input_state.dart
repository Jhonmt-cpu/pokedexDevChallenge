part of 'input_bloc.dart';

abstract class InputState extends Equatable {
  const InputState();

  @override
  List<Object> get props => [];
}

class InputUnfocused extends InputState {}

class InputFocused extends InputState {}
