import 'package:budget_app_test/Features/display_all_orders/domain/entities/order_entity.dart';
import 'package:budget_app_test/Features/display_all_orders/domain/repositories/get_all_orders_repository.dart';
import 'package:budget_app_test/Features/display_all_orders/domain/usecases/get_all_orders.dart';
import 'package:budget_app_test/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockGetAllOrdersRepository extends Mock
    implements GetAllOrdersRepository {}

void main() {
  late GetAllOrders usecase;
  late MockGetAllOrdersRepository mockGetAllOrdersRepository;

  setUp(() {
    mockGetAllOrdersRepository = MockGetAllOrdersRepository();
    usecase = GetAllOrders(repo: mockGetAllOrdersRepository);
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
    'should get order from the repository',
    () async {
      //arrange
      when(() => mockGetAllOrdersRepository.getAllOrders())
          .thenAnswer((_) async => Right(tOrder));
      // act
      final result = await usecase(NoParams());

      //assert
      expect(result, Right(tOrder));
      verify(() => mockGetAllOrdersRepository.getAllOrders()).called(1);
      verifyNoMoreInteractions(mockGetAllOrdersRepository);
    },
  );
}
