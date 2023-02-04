import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/usecases/get_all_orders.dart';

part 'display_orders_state.dart';

class DisplayOrdersCubit extends Cubit<DisplayOrdersState> {
  final GetAllOrders getAllOrders;
  DisplayOrdersCubit({required this.getAllOrders}) : super(Initial());

  Future<void> fetchOrders() async {
    emit(Loading());
    final response = await getAllOrders(NoParams());
    response.fold((l) => emit(Error(message: 'Server Failure')),
        (r) => emit(Loaded(orders: r)));
  }
}
