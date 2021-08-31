part of 'generation_tab_bloc.dart';

abstract class GenerationTabEvent extends Equatable {
  const GenerationTabEvent();

  @override
  List<Object> get props => [];
}

class ChangeGeneration extends GenerationTabEvent {
  final int generationIdSelected;

  ChangeGeneration({required this.generationIdSelected});

  @override
  List<Object> get props => [generationIdSelected];
}
