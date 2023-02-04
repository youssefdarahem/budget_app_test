import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart';
import '../models/order_model.dart';

abstract class OrdersRemoteDataSource {
  /// calls the https://f45e6e71-94ac-4e09-bea7-64ac7f13cc11.mock.pstmn.io/GetAllOrders endpoint.
  ///
  /// Throws a ServerException to all code errors
  Future<List<OrderModel>> getAllOrders();
}

class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  final http.Client httpClient;

  OrdersRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<List<OrderModel>> getAllOrders() async {
    List<OrderModel> orders = [];
    var uri = Uri.parse(
        'https://f45e6e71-94ac-4e09-bea7-64ac7f13cc11.mock.pstmn.io/GetAllOrders');
    try {
      var response = await httpClient.get(uri);
      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        for (var json in result) {
          orders.add(OrderModel.fromJson(json));
        }
        return orders;
      } else {
        throw ServerException();
      }
    } finally {
      httpClient.close();
    }
  }
}
