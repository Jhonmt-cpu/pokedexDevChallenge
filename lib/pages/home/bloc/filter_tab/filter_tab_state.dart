part of 'filter_tab_bloc.dart';

abstract class FilterTabState extends Equatable {
  const FilterTabState();

  @override
  List<Object> get props => [];
}

class FilterTabItensSelected extends FilterTabState {
  final List<String> types;
  final List<String> weaknesses;
  final List<String> heights;
  final List<String> weights;
  final int? minRangeNumber;
  final int? maxRangeNumber;
  final List<double> range;

  FilterTabItensSelected({
    required this.types,
    required this.weaknesses,
    required this.heights,
    required this.weights,
    required this.minRangeNumber,
    required this.maxRangeNumber,
    required this.range,
  });

  @override
  List<Object> get props => [
        types,
        weaknesses,
        heights,
        weights,
        range,
      ];
}
