part of 'generation_tab_bloc.dart';

abstract class GenerationTabState extends Equatable {
  const GenerationTabState();

  @override
  List<Object> get props => [];
}

class GeneraionTabSelected extends GenerationTabState {
  final int generationIdSelected;

  GeneraionTabSelected({required this.generationIdSelected});

  @override
  List<Object> get props => [generationIdSelected];
}
