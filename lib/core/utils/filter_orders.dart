import '../../Features/display_all_orders/domain/entities/order_entity.dart';
import '../../Features/filter_orders/domain/entities/filter_type.dart';

class OrdersFilter {
  Map<FilterType, List<OrderEntity>> filter(
    List<OrderEntity> toBeFiltered,
  ) {
    //! dateTime is set as if today is 30 Aug 2021 to match results from the API
    DateTime now = DateTime(2021, 8, 30);

    Map<FilterType, List<OrderEntity>> filtered = {};
    List<OrderEntity> today = [];
    List<OrderEntity> thisWeek = [];
    List<OrderEntity> thisMonth = [];

    for (var order in toBeFiltered) {
      if (order.dateTimeConverted.day == now.day) {
        today.add(order);
      }
    }

    var weekDay = now.weekday;
    var firstDayOfWeek = now.subtract(Duration(days: weekDay));
    for (var order in toBeFiltered) {
      if (order.dateTimeConverted.isAfter(firstDayOfWeek)) {
        thisWeek.add(order);
      }
    }

    for (var order in toBeFiltered) {
      if (order.dateTimeConverted.month == now.month) {
        thisMonth.add(order);
      }
    }

    filtered.addAll({
      FilterType.today: today,
      FilterType.week: thisWeek,
      FilterType.month: thisMonth
    });

    return filtered;
  }
}
