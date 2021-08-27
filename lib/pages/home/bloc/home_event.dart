part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class FetchHomeListEvent extends HomeEvent {
  final int generationId;

  FetchHomeListEvent({required this.generationId});
}
