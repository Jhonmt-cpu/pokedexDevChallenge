part of 'sliding_sheet_bloc.dart';

abstract class SlidingSheetEvent extends Equatable {
  const SlidingSheetEvent();

  @override
  List<Object> get props => [];
}

class OpenSlidingSheetEvent extends SlidingSheetEvent {
  final BuildContext context;
  final Widget page;

  @override
  List<Object> get props => [context, page];

  OpenSlidingSheetEvent({
    required this.context,
    required this.page,
  });
}
