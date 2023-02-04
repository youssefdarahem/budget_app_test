import 'package:budget_app_test/Features/filter_orders/data/datasources/filter_orders_data_source.dart';
import 'package:budget_app_test/core/error/exceptions.dart';

import '../../domain/entities/filter_type.dart';
import '../../../display_all_orders/domain/entities/order_entity.dart';
import '../../domain/repositories/filter_orders_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

class FilterOrdersRepositoryImpl implements FilterOrdersRepository {
  final FilterOrdersDataSource filterOrdersDataSource;

  FilterOrdersRepositoryImpl({required this.filterOrdersDataSource});

  @override
  Either<Failure, List<OrderEntity>> filterOrders(
      List<OrderEntity> orders, FilterType filterType) {
    try {
      return Right(filterOrdersDataSource.filterOrders(orders, filterType));
    } on FilterException {
      return Left(FilterFailure());
    }
  }
}
