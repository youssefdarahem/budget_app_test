// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'display_orders_cubit.dart';

abstract class DisplayOrdersState extends Equatable {
  const DisplayOrdersState();

  @override
  List<Object> get props => [];
}

class Initial extends DisplayOrdersState {}

class Loading extends DisplayOrdersState {}

class Loaded extends DisplayOrdersState {
  final List<OrderEntity> orders;

  const Loaded({required this.orders});

  @override
  List<Object> get props => [orders];
}

class Error extends DisplayOrdersState {
  final String message;
  Error({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}
