import 'package:budget_app_test/Features/display_all_orders/data/datasources/orders_remote_data_source.dart';
import 'package:budget_app_test/Features/display_all_orders/data/models/order_model.dart';
import 'package:budget_app_test/Features/filter_orders/data/datasources/filter_orders_data_source.dart';
import 'package:budget_app_test/Features/filter_orders/domain/entities/filter_type.dart';
import 'package:budget_app_test/core/error/failures.dart';
import 'package:budget_app_test/core/error/exceptions.dart';
import 'package:budget_app_test/core/utils/filter_orders.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockOrdersFilter extends Mock implements OrdersFilter {}

void main() {
  late FilterOrdersDataSourceImpl dataSource;
  late MockOrdersFilter mockOrdersFilter;

  List<OrderModel> tOrders = [
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
    )
  ];

  Map<FilterType, List<OrderModel>> tOrderFiltered = {
    FilterType.today: [
      OrderModel(
        orderNo: '#54353453453',
        itemCount: 4,
        dateTimeConverted: DateTime(2021, 8, 30),
        dateTime: "30 Aug 2021 - 16:15 pm",
        sold: 240,
        driver: 30,
        food: 210,
        commission: 210,
        netProfit: 304,
      )
    ]
  };

  setUp(() {
    registerFallbackValue(FilterType.today);
    mockOrdersFilter = MockOrdersFilter();
    dataSource = FilterOrdersDataSourceImpl(ordersFilter: mockOrdersFilter);
  });

  test(
    'Should call FilterOrders',
    () async {
      // arrange
      when(() => mockOrdersFilter.filter(any())).thenReturn(tOrderFiltered);
      // act
      dataSource.filterOrders(tOrders);
      // assert
      verify(() => mockOrdersFilter.filter(tOrders));
    },
  );
  test(
    'should return List<Order> when the call is successful',
    () async {
      // arrange
      when(() => mockOrdersFilter.filter(any())).thenReturn(tOrderFiltered);
      // act
      final result = dataSource.filterOrders(tOrders);

      // assert
      expect(result, equals(tOrderFiltered));
    },
  );

  // test(
  //   'should throw a FilterException when an Error happens',
  //   () async {
  //     // arrange
  //     when(() => mockHttpClient.get(any(), headers: any(named: 'headers')))
  //         .thenAnswer((_) async => http.Response('Something went wrong', 404));
  //     // act
  //     final call = dataSource.getAllOrders;
  //     // assert
  //     expect(() => call(), throwsA(const TypeMatcher<ServerException>()));
  //   },
  // );
}
