import '../../Features/display_all_orders/domain/entities/order_entity.dart';
import '../../Features/filter_orders/domain/entities/filter_type.dart';

class OrdersFilter {
  List<OrderEntity> filter(
    List<OrderEntity> toBeFiltered,
    FilterType filterType,
  ) {
    //! dateTime is set as if today is 30 Aug 2021 to match results from the API
    DateTime now = DateTime(2021, 8, 30);

    List<OrderEntity> filtered = [];
    switch (filterType) {
      case FilterType.today:
        {
          for (var order in toBeFiltered) {
            if (order.dateTimeConverted.day == now.day) {
              filtered.add(order);
            }
          }
        }
        break;
      case FilterType.week:
        {
          var weekDay = now.weekday;
          var firstDayOfWeek = now.subtract(Duration(days: weekDay));
          for (var order in toBeFiltered) {
            if (order.dateTimeConverted.isAfter(firstDayOfWeek)) {
              filtered.add(order);
            }
          }
        }
        break;
      case FilterType.month:
        {
          for (var order in toBeFiltered) {
            if (order.dateTimeConverted.month == now.month) {
              filtered.add(order);
            }
          }
        }
        break;
    }

    return filtered;
  }
}
