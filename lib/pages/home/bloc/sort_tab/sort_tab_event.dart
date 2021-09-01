part of 'sort_tab_bloc.dart';

abstract class SortTabEvent extends Equatable {
  const SortTabEvent();

  @override
  List<Object> get props => [];
}

class ChangeSortType extends SortTabEvent {
  final int sortTypeId;

  @override
  List<Object> get props => [sortTypeId];

  ChangeSortType({required this.sortTypeId})
      : assert(sortTypeId >= 1 && sortTypeId <= 4);
}
