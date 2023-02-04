import 'package:budget_app_test/Features/display_all_orders/data/models/order_model.dart';
import 'package:budget_app_test/Features/display_all_orders/domain/entities/order_entity.dart';
import 'package:budget_app_test/Features/filter_orders/domain/entities/filter_type.dart';
import 'package:budget_app_test/core/utils/filter_orders.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  late OrdersFilter ordersFilter;

  List<OrderModel> tOrders = [
    OrderModel(
      orderNo: '#54353453453',
      itemCount: 4,
      dateTimeConverted: DateTime(2021, 9, 1),
      dateTime: "1 Sep 2021 - 16:15 pm",
      sold: 240,
      driver: 30,
      food: 210,
      commission: 293,
      netProfit: 304,
    ),
    OrderModel(
      orderNo: '#54353453453',
      itemCount: 4,
      dateTimeConverted: DateTime(2021, 8, 31),
      dateTime: "31 Aug 2021 - 16:15 pm",
      sold: 240,
      driver: 30,
      food: 210,
      commission: 293,
      netProfit: 304,
    ),
    OrderModel(
      orderNo: '#54353453453',
      itemCount: 4,
      dateTimeConverted: DateTime(2021, 8, 30),
      dateTime: "30 Aug 2021 - 16:15 pm",
      sold: 240,
      driver: 30,
      food: 210,
      commission: 293,
      netProfit: 304,
    ),
    OrderModel(
      orderNo: '#54353453453',
      itemCount: 4,
      dateTimeConverted: DateTime(2021, 8, 29),
      dateTime: "29 Aug 2021 - 16:15 pm",
      sold: 240,
      driver: 30,
      food: 210,
      commission: 293,
      netProfit: 304,
    ),
    OrderModel(
      orderNo: '#54353453453',
      itemCount: 4,
      dateTimeConverted: DateTime(2021, 8, 28),
      dateTime: "28 Aug 2021 - 16:15 pm",
      sold: 240,
      driver: 30,
      food: 210,
      commission: 293,
      netProfit: 304,
    )
  ];

  List<OrderModel> tFilteredToday = [
    OrderModel(
      orderNo: '#54353453453',
      itemCount: 4,
      dateTimeConverted: DateTime(2021, 8, 30),
      dateTime: "30 Aug 2021 - 16:15 pm",
      sold: 240,
      driver: 30,
      food: 210,
      commission: 293,
      netProfit: 304,
    ),
  ];

  List<OrderModel> tFilteredWeek = [
    OrderModel(
      orderNo: '#54353453453',
      itemCount: 4,
      dateTimeConverted: DateTime(2021, 9, 1),
      dateTime: "1 Sep 2021 - 16:15 pm",
      sold: 240,
      driver: 30,
      food: 210,
      commission: 293,
      netProfit: 304,
    ),
    OrderModel(
      orderNo: '#54353453453',
      itemCount: 4,
      dateTimeConverted: DateTime(2021, 8, 31),
      dateTime: "31 Aug 2021 - 16:15 pm",
      sold: 240,
      driver: 30,
      food: 210,
      commission: 293,
      netProfit: 304,
    ),
    OrderModel(
      orderNo: '#54353453453',
      itemCount: 4,
      dateTimeConverted: DateTime(2021, 8, 30),
      dateTime: "30 Aug 2021 - 16:15 pm",
      sold: 240,
      driver: 30,
      food: 210,
      commission: 293,
      netProfit: 304,
    ),
  ];

  List<OrderModel> tFilteredMonth = [
    OrderModel(
      orderNo: '#54353453453',
      itemCount: 4,
      dateTimeConverted: DateTime(2021, 8, 31),
      dateTime: "31 Aug 2021 - 16:15 pm",
      sold: 240,
      driver: 30,
      food: 210,
      commission: 293,
      netProfit: 304,
    ),
    OrderModel(
      orderNo: '#54353453453',
      itemCount: 4,
      dateTimeConverted: DateTime(2021, 8, 30),
      dateTime: "30 Aug 2021 - 16:15 pm",
      sold: 240,
      driver: 30,
      food: 210,
      commission: 293,
      netProfit: 304,
    ),
    OrderModel(
      orderNo: '#54353453453',
      itemCount: 4,
      dateTimeConverted: DateTime(2021, 8, 29),
      dateTime: "29 Aug 2021 - 16:15 pm",
      sold: 240,
      driver: 30,
      food: 210,
      commission: 293,
      netProfit: 304,
    ),
    OrderModel(
      orderNo: '#54353453453',
      itemCount: 4,
      dateTimeConverted: DateTime(2021, 8, 28),
      dateTime: "28 Aug 2021 - 16:15 pm",
      sold: 240,
      driver: 30,
      food: 210,
      commission: 293,
      netProfit: 304,
    )
  ];

  // Map<FilterType, List<OrderEntity>> tOrderFiltered = {
  //   FilterType.today: tFilteredToday,
  //   FilterType.month: tFilteredMonth,
  //   FilterType.week: tFilteredWeek,
  // };

  setUp(() {
    ordersFilter = OrdersFilter();
  });

  test(
    'should filter by day',
    () {
      // act
      final Map<FilterType, List<OrderEntity>> result =
          ordersFilter.filter(tOrders);
      final listOrders = result[FilterType.today];
      // assert
      expect(listOrders, equals(tFilteredToday));
    },
  );

  test(
    'should filter by week',
    () {
      // act
      final result = ordersFilter.filter(tOrders);
      final listOrders = result[FilterType.week];
      // assert
      expect(listOrders, equals(tFilteredWeek));
    },
  );

  test(
    'should filter by month',
    () {
      // act
      final result = ordersFilter.filter(tOrders);
      final listOrders = result[FilterType.month];
      // assert
      expect(listOrders, equals(tFilteredMonth));
    },
  );
}
