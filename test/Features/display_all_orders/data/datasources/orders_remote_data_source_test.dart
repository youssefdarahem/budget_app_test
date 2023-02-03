import 'package:budget_app_test/Features/display_all_orders/data/datasources/orders_remote_data_source.dart';
import 'package:budget_app_test/Features/display_all_orders/data/models/order_model.dart';
import 'package:http/http.dart' as http;
import 'package:budget_app_test/core/error/failures.dart';
import 'package:budget_app_test/core/error/exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late OrdersRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  List<OrderModel> tOrders = [
    OrderModel(
      orderNo: '#54353453453',
      itemCount: 4,
      dateTime: DateTime(2021, 8, 30),
      sold: 240,
      driver: 30,
      food: 210,
      commission: 293,
      netProfit: 304,
    ),
    OrderModel(
      orderNo: '#54353453453',
      itemCount: 4,
      dateTime: DateTime(2021, 8, 29),
      sold: 240,
      driver: 30,
      food: 210,
      commission: 293,
      netProfit: 304,
    )
  ];

  setUp(() {
    registerFallbackValue(Uri());
    mockHttpClient = MockHttpClient();
    dataSource = OrdersRemoteDataSourceImpl(httpClient: mockHttpClient);
  });

  var uri = Uri.parse(
      'https://f45e6e71-94ac-4e09-bea7-64ac7f13cc11.mock.pstmn.io/GetAllOrders');
  test(
    '''should perform a GET request on a URL with number
       being the endpoint and with application/json header''',
    () async {
      // arrange
      when(() => mockHttpClient.get(any()))
          .thenAnswer((_) async => http.Response(fixture('orders.json'), 200));
      // act
      dataSource.getAllOrders();
      // assert
      verify(() => mockHttpClient.get(
            uri,
          ));
    },
  );
  test(
    'should return NumberTrivia when the response code is 200 (success)',
    () async {
      // arrange
      when(() => mockHttpClient.get(any())).thenAnswer(
          (_) async => http.Response(fixture('mini_orders.json'), 200));
      // act
      final result = await dataSource.getAllOrders();
      ;
      // assert
      expect(result, equals(tOrders));
    },
  );

  test(
    'should throw a ServerException when the response code is 404 or other',
    () async {
      // arrange
      when(() => mockHttpClient.get(any(), headers: any(named: 'headers')))
          .thenAnswer((_) async => http.Response('Something went wrong', 404));
      // act
      final call = dataSource.getAllOrders;
      // assert
      expect(() => call(), throwsA(const TypeMatcher<ServerException>()));
    },
  );
}
