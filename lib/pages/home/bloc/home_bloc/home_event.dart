part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class FetchHomeListEvent extends HomeEvent {
  final int? generationId;

  FetchHomeListEvent({this.generationId});

  @override
  List<Object> get props => [];
}

class FilterListByInputEvent extends HomeEvent {
  final String value;

  FilterListByInputEvent({required this.value});

  @override
  List<Object> get props => [value];
}

class SortListEvent extends HomeEvent {
  final int sortType;

  SortListEvent({required this.sortType});

  @override
  List<Object> get props => [sortType];
}

class FilterListEvent extends HomeEvent {
  final List<String> types;
  final List<String> weakenesses;
  final List<String> heights;
  final List<String> weights;
  final List<double> range;

  FilterListEvent({
    required this.types,
    required this.weakenesses,
    required this.heights,
    required this.weights,
    required this.range,
  });

  @override
  List<Object> get props => [
        types,
        weakenesses,
        heights,
        weights,
        range,
      ];
}
