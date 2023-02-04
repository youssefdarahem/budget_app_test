import '../../../../core/utils/filter_orders.dart';
import '../../../display_all_orders/domain/entities/order_entity.dart';
import '../../domain/entities/filter_type.dart';

abstract class FilterOrdersDataSource {
  /// calls the filter method from utils with the ordersToBeFiltered and the filter type
  ///
  /// throws a FilterException to any code error
  List<OrderEntity> filterOrders(List<OrderEntity> orders, FilterType type);
}

class FilterOrdersDataSourceImpl implements FilterOrdersDataSource {
  final OrdersFilter ordersFilter;

  FilterOrdersDataSourceImpl({required this.ordersFilter});
  @override
  List<OrderEntity> filterOrders(List<OrderEntity> orders, FilterType type) {
    return ordersFilter.filter(orders, type);
  }
}
