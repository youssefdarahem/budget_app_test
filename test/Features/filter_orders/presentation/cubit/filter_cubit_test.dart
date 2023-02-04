import 'package:budget_app_test/Features/display_all_orders/domain/entities/order_entity.dart';
import 'package:budget_app_test/Features/display_all_orders/domain/usecases/get_all_orders.dart';

import 'package:budget_app_test/Features/filter_orders/domain/entities/filter_type.dart';
import 'package:budget_app_test/Features/filter_orders/domain/usecases/filter_orders.dart';
import 'package:budget_app_test/Features/filter_orders/presentation/cubit/filter_cubit.dart';

import 'package:budget_app_test/core/error/failures.dart';

import 'package:budget_app_test/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockFilterOrders extends Mock implements FilterOrders {}

class FakeParams extends Fake implements Params {}

void main() {
  late FilterCubit cubit;
  late MockFilterOrders mockFilterOrders;

  List<OrderEntity> tOrder = [
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

  setUp(() {
    registerFallbackValue(FakeParams());
    mockFilterOrders = MockFilterOrders();
    cubit = FilterCubit(filterOrders: mockFilterOrders);
  });

  test(
    'initialState should be Empty',
    () {
      // assert
      expect(cubit.state, equals(FilterInitial()));
    },
  );

  test(
    'should emit [Loaded] when the call is successful',
    () async {
      // arrange
      when(() => mockFilterOrders(any()))
          .thenAnswer((_) async => Right(tOrderFiltered));
      // assert later
      final expected = [
        FilterLoading(),
        FilterLoaded(filtered: tOrderFiltered),
      ];
      expectLater(cubit.stream, emitsInOrder(expected));
      // act
      cubit.filter(tOrder);
    },
  );

  test(
    'should emit [Error] when the call is unsuccessful',
    () async {
      // arrange
      when(() => mockFilterOrders(any()))
          .thenAnswer((_) async => Left(ServerFailure()));
      // assert later
      final expected = [
        FilterLoading(),
        FilterError(message: 'Filter Failure'),
      ];
      expectLater(cubit.stream, emitsInOrder(expected));
      // act
      cubit.filter(tOrder);
    },
  );
}
