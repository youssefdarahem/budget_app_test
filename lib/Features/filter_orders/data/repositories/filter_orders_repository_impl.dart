import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../display_all_orders/domain/entities/order_entity.dart';
import '../../domain/entities/filter_type.dart';
import '../../domain/repositories/filter_orders_repository.dart';
import '../datasources/filter_orders_data_source.dart';

class FilterOrdersRepositoryImpl implements FilterOrdersRepository {
  final FilterOrdersDataSource filterOrdersDataSource;

  FilterOrdersRepositoryImpl({required this.filterOrdersDataSource});

  @override
  Either<Failure, Map<FilterType, List<OrderEntity>>> filterOrders(
      List<OrderEntity> orders) {
    try {
      return Right(filterOrdersDataSource.filterOrders(orders));
    } on FilterException {
      return Left(FilterFailure());
    }
  }
}
