import 'package:budget_app_test/Features/display_all_orders/domain/entities/order_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/Failure.dart';

abstract class GetAllOrdersRepository {
  Future<Either<Failure, List<OrderEntity>>> getAllOrders();
}
