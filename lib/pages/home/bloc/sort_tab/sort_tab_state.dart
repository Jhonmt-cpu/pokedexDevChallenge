part of 'sort_tab_bloc.dart';

abstract class SortTabState extends Equatable {
  const SortTabState();

  @override
  List<Object> get props => [];
}

class SortTabSelected extends SortTabState {
  final int sortTypeId;

  @override
  List<Object> get props => [sortTypeId];

  SortTabSelected({required this.sortTypeId});
}
