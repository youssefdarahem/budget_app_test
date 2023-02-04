import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../display_all_orders/domain/entities/order_entity.dart';
import '../../domain/entities/filter_type.dart';
import '../../domain/usecases/filter_orders.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  final FilterOrders filterOrders;
  FilterCubit({required this.filterOrders}) : super(FilterInitial());

  void filter(List<OrderEntity> orders) async {
    emit(FilterLoading());
    final response = await filterOrders(Params(toBeFiltered: orders));
    response.fold((l) => emit(const FilterError(message: 'Filter Failure')),
        (r) => emit(FilterLoaded(filtered: r)));
  }
}
