import 'package:budget_app_test/Features/filter_orders/domain/repositories/filter_orders_repository.dart';

import '../../../display_all_orders/domain/entities/order_entity.dart';
import '../entities/filter_type.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class FilterOrders implements UseCase<List<OrderEntity>, Params> {
  final FilterOrdersRepository repo;

  FilterOrders({required this.repo});
  @override
  Future<Either<Failure, List<OrderEntity>>> call(Params params) {
    return Future.value(
        repo.filterOrders(params.toBeFiltered, params.filterType));
  }
}

class Params extends Equatable {
  final List<OrderEntity> toBeFiltered;
  final FilterType filterType;
  const Params({
    required this.toBeFiltered,
    required this.filterType,
  });

  @override
  List<Object> get props => [toBeFiltered, filterType];
}
