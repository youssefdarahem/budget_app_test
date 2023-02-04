import 'package:budget_app_test/Features/display_all_orders/domain/entities/order_entity.dart';

import 'package:budget_app_test/Features/display_all_orders/domain/usecases/get_all_orders.dart';
import 'package:budget_app_test/Features/filter_orders/domain/entities/filter_type.dart';
import 'package:budget_app_test/Features/filter_orders/domain/repositories/filter_orders_repository.dart';
import 'package:budget_app_test/Features/filter_orders/domain/usecases/filter_orders.dart';
import 'package:budget_app_test/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockFilterOrdersRepository extends Mock
    implements FilterOrdersRepository {}

class FakeParams extends Fake implements Params {}

void main() {
  late FilterOrders usecase;
  late MockFilterOrdersRepository mockFilterOrdersRepository;

  setUp(() {
    registerFallbackValue(FakeParams());
    registerFallbackValue(FilterType.today);
    mockFilterOrdersRepository = MockFilterOrdersRepository();
    usecase = FilterOrders(repo: mockFilterOrdersRepository);
  });

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

  test(
    'should get orders from the repository',
    () async {
      //arrange
      when(() => mockFilterOrdersRepository.filterOrders(any(), any()))
          .thenReturn(Right(tOrder));
      // act
      var tFilterType = FilterType.week;
      final result =
          await usecase(Params(filterType: tFilterType, toBeFiltered: tOrder));

      //assert
      expect(result, Right(tOrder));
      verify(() => mockFilterOrdersRepository.filterOrders(tOrder, tFilterType))
          .called(1);
      verifyNoMoreInteractions(mockFilterOrdersRepository);
    },
  );
}
