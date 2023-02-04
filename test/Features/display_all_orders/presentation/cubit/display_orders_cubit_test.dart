import 'package:budget_app_test/Features/display_all_orders/domain/entities/order_entity.dart';
import 'package:budget_app_test/Features/display_all_orders/domain/usecases/get_all_orders.dart';
import 'package:budget_app_test/Features/display_all_orders/presentation/cubit/display_orders_cubit.dart';

import 'package:budget_app_test/core/error/failures.dart';

import 'package:budget_app_test/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockGetAllOrders extends Mock implements GetAllOrders {}

class FakeNoParams extends Fake implements NoParams {}

void main() {
  late DisplayOrdersCubit cubit;
  late MockGetAllOrders mockGetAllOrders;

  List<OrderEntity> tOrder = [
    OrderEntity(
      orderNo: '#54353453453',
      itemCount: 4,

      dateTime: DateTime(2021, 8, 30),
      // dateTime: "30 Aug 2021 - 16:15 pm",
      sold: 240,
      driver: 30,
      food: 210,
      commission: 210,
      netProfit: 304,
    )
  ];
  setUp(() {
    registerFallbackValue(FakeNoParams());
    mockGetAllOrders = MockGetAllOrders();
    cubit = DisplayOrdersCubit(getAllOrders: mockGetAllOrders);
  });

  test(
    'initialState should be Empty',
    () {
      // assert
      expect(cubit.state, equals(Initial()));
    },
  );

  test(
    'should emit [Loaded] when the call is successful',
    () async {
      // arrange
      when(() => mockGetAllOrders(any()))
          .thenAnswer((_) async => Right(tOrder));
      // assert later
      final expected = [
        Loading(),
        Loaded(orders: tOrder),
      ];
      expectLater(cubit.stream, emitsInOrder(expected));
      // act
      cubit.fetchOrders();
    },
  );

  test(
    'should emit [Error] when the call is unsuccessful',
    () async {
      // arrange
      when(() => mockGetAllOrders(any()))
          .thenAnswer((_) async => Left(ServerFailure()));
      // assert later
      final expected = [
        Loading(),
        Error(message: 'Server Failure'),
      ];
      expectLater(cubit.stream, emitsInOrder(expected));
      // act
      cubit.fetchOrders();
    },
  );
}
