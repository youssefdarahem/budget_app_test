import 'package:budget_app_test/Features/display_all_orders/data/models/order_model.dart';
import 'package:budget_app_test/Features/display_all_orders/domain/entities/order_entity.dart';
import 'package:budget_app_test/Features/filter_orders/data/datasources/filter_orders_data_source.dart';
import 'package:budget_app_test/Features/filter_orders/data/repositories/filter_orders_repository_impl.dart';
import 'package:budget_app_test/Features/filter_orders/domain/entities/filter_type.dart';
import 'package:budget_app_test/core/error/exceptions.dart';
import 'package:budget_app_test/core/error/failures.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';

class MockFilterOrdersDataSource extends Mock
    implements FilterOrdersDataSource {}

void main() {
  late MockFilterOrdersDataSource mockFilterOrdersDataSource;
  late FilterOrdersRepositoryImpl repo;

  List<OrderModel> tOrderModel = [
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
    )
  ];

  Map<FilterType, List<OrderEntity>> tOrderFiltered = {
    FilterType.today: [
      OrderEntity(
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

  List<OrderEntity> tOrder = tOrderModel;

  setUp(() {
    registerFallbackValue(FilterType.month);
    mockFilterOrdersDataSource = MockFilterOrdersDataSource();
    repo = FilterOrdersRepositoryImpl(
        filterOrdersDataSource: mockFilterOrdersDataSource);
  });

  test(
    'should return a list of orders when the call to the data source is successful',
    () async {
      // arrange
      when(() => mockFilterOrdersDataSource.filterOrders(any()))
          .thenReturn(tOrderFiltered);

      // act
      final result = repo.filterOrders(tOrder);

      // assert
      expect(result, Right(tOrderFiltered));
    },
  );

  test(
    'should return a ServerFailure when the call to the data source is unsuccessful',
    () async {
      // arrange
      when(() => mockFilterOrdersDataSource.filterOrders(any()))
          .thenThrow(FilterException());

      // act
      final result = await repo.filterOrders(tOrder);

      // assert
      expect(result, Left(FilterFailure()));
    },
  );
}
