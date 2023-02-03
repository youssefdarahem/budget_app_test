import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/order_entity.dart';

abstract class GetAllOrdersRepository {
  Future<Either<Failure, List<OrderEntity>>> getAllOrders();
}
