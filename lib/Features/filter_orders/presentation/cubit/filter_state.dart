part of 'filter_cubit.dart';

abstract class FilterState extends Equatable {
  const FilterState();

  @override
  List<Object> get props => [];
}

class FilterInitial extends FilterState {}

class FilterLoading extends FilterState {}

class FilterLoaded extends FilterState {
  final Map<FilterType, List<OrderEntity>> filtered;

  FilterLoaded({required this.filtered});

  @override
  List<Object> get props => [filtered];
}

class FilterError extends FilterState {
  final String message;
  const FilterError({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}
