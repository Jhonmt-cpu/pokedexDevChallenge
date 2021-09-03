part of 'filter_tab_bloc.dart';

abstract class FilterTabEvent extends Equatable {
  const FilterTabEvent();

  @override
  List<Object> get props => [];
}

class ChangeTypesEvent extends FilterTabEvent {
  final String type;
  final bool shouldAdd;

  ChangeTypesEvent({required this.type, required this.shouldAdd});

  @override
  List<Object> get props => [type, shouldAdd];
}

class ChangeWeaknessesEvent extends FilterTabEvent {
  final String weakness;
  final bool shouldAdd;

  ChangeWeaknessesEvent({required this.weakness, required this.shouldAdd});

  @override
  List<Object> get props => [weakness, shouldAdd];
}

class ChangeHeightsEvent extends FilterTabEvent {
  final String height;
  final bool shouldAdd;

  ChangeHeightsEvent({
    required this.shouldAdd,
    required this.height,
  });

  @override
  List<Object> get props => [height, shouldAdd];
}

class ChangeWeightsEvent extends FilterTabEvent {
  final String weight;
  final bool shouldAdd;

  ChangeWeightsEvent({required this.weight, required this.shouldAdd});

  @override
  List<Object> get props => [weight, shouldAdd];
}

class ChangeRangeEvent extends FilterTabEvent {
  final List<String> newRange;

  ChangeRangeEvent({required this.newRange});

  @override
  List<Object> get props => [newRange];
}

class ResetEvent extends FilterTabEvent {
  @override
  List<Object> get props => [];
}
