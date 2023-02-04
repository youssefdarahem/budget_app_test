import 'package:budget_app_test/Features/display_all_orders/domain/entities/order_entity.dart';
import 'package:budget_app_test/Features/filter_orders/domain/entities/filter_type.dart';

abstract class FilterOrdersDataSource {
  /// calls the filter method from utils with the ordersToBeFiltered and the filter type
  ///
  /// throws a FilterException to any code error
  List<OrderEntity> filterOrders(List<OrderEntity> orders, FilterType type);
}

class FilterOrdersDataSourceImpl implements FilterOrdersDataSource {
  @override
  List<OrderEntity> filterOrders(List<OrderEntity> orders, FilterType type) {
    // TODO: implement filterOrders
    throw UnimplementedError();
  }
}
