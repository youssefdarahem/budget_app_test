import '../entities/filter_type.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../display_all_orders/domain/entities/order_entity.dart';

abstract class FilterOrdersRepository {
  Either<Failure, Map<FilterType, List<OrderEntity>>> filterOrders(
      List<OrderEntity> orders);
}
