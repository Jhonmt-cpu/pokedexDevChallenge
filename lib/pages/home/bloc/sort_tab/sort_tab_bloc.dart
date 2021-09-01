import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sort_tab_event.dart';
part 'sort_tab_state.dart';

class SortTabBloc extends Bloc<SortTabEvent, SortTabState> {
  SortTabBloc() : super(SortTabSelected(sortTypeId: 1));

  int sortTypeId = 1;

  @override
  Stream<SortTabState> mapEventToState(
    SortTabEvent event,
  ) async* {
    if (event is ChangeSortType) {
      sortTypeId = event.sortTypeId;
      yield SortTabSelected(sortTypeId: sortTypeId);
    }
  }
}
