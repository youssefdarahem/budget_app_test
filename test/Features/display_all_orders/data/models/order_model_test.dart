import 'dart:convert';

import 'package:budget_app_test/Features/display_all_orders/data/models/order_model.dart';
import 'package:budget_app_test/Features/display_all_orders/domain/entities/order_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  OrderModel tOrder = OrderModel(
    orderNo: '#54353453453',
    itemCount: 4,
    dateTime: DateTime(2021, 8, 30),
    sold: 240,
    driver: 30,
    food: 210,
    commission: 293,
    netProfit: 304,
  );

  test(
    'should be a subclass of OrderEntity entity',
    () async {
      // assert
      expect(tOrder, isA<OrderEntity>());
    },
  );

  test(
    'should return a valid model',
    () async {
      // arrange
      final List<dynamic> jsonMapList = json.decode(fixture('orders.json'));
      final Map<String, dynamic> jsonMap = jsonMapList[0];
      // act
      final result = OrderModel.fromJson(jsonMap);
      // assert
      expect(result, tOrder);
    },
  );

  // group('toJson', () {
  //   test(
  //     'should return a JSON map containing the proper data',
  //     () async {
  //       // act
  //       final result = tOrder.toJson();
  //       // assert
  //       final expectedMap = {
  //         "orderNo": "#54353453453",
  //         "orderItemsCount": 4,
  //         "orderDateTime": "30 Aug 2021 - 16:15 pm",
  //         "orderSold": 240,
  //         "orderDriver": 30,
  //         "orderFood": 210,
  //         "orderCommission": 293,
  //         "orderNetProfit": 304
  //       };
  //       expect(result, expectedMap);
  //     },
  //   );
  // });
}
