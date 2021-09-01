part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class FetchHomeListEvent extends HomeEvent {
  final int? generationId;

  FetchHomeListEvent({this.generationId});
}

class FilterListByInputEvent extends HomeEvent {
  final String value;

  FilterListByInputEvent({required this.value});
}

class SortListEvent extends HomeEvent {
  final int sortType;

  SortListEvent({required this.sortType});
}
