import 'package:budget_app_test/Features/display_all_orders/data/datasources/orders_remote_data_source.dart';
import 'package:budget_app_test/Features/display_all_orders/data/models/order_model.dart';
import 'package:budget_app_test/Features/display_all_orders/data/repositories/get_all_orders_repository_impl.dart';
import 'package:budget_app_test/Features/display_all_orders/domain/entities/order_entity.dart';
import 'package:budget_app_test/Features/display_all_orders/domain/repositories/get_all_orders_repository.dart';
import 'package:budget_app_test/core/error/failures.dart';
import 'package:budget_app_test/core/error/exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockOrderRemoteDataSource extends Mock
    implements OrdersRemoteDataSource {}

void main() {
  late MockOrderRemoteDataSource mockOrderRemoteDataSource;
  late GetAllOrdersRepositoryImpl repo;

  const List<OrderModel> tOrderModel = [
    OrderModel(
      orderNo: '#54353453453',
      itemCount: 4,
      dateTime: "30 Aug 2021 - 16:15 pm",
      sold: 240,
      driver: 30,
      food: 210,
      commission: 293,
      netProfit: 304,
    )
  ];

  const List<OrderEntity> tOrder = tOrderModel;

  setUp(() {
    mockOrderRemoteDataSource = MockOrderRemoteDataSource();
    repo =
        GetAllOrdersRepositoryImpl(remoteDataSource: mockOrderRemoteDataSource);
  });

  test(
    'should return a list of orders when the call to the remote source is successful',
    () async {
      // arrange
      when(() => mockOrderRemoteDataSource.getAllOrders())
          .thenAnswer((_) async => tOrderModel);

      // act
      final result = await repo.getAllOrders();

      // assert
      expect(result, const Right(tOrderModel));
    },
  );

  test(
    'should return a ServerFailure when the call to the remote source is unsuccessful',
    () async {
      // arrange
      when(() => mockOrderRemoteDataSource.getAllOrders())
          .thenThrow(ServerException());

      // act
      final result = await repo.getAllOrders();

      // assert
      expect(result, Left(ServerFailure()));
    },
  );
}
