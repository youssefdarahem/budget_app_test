import '../repositories/filter_orders_repository.dart';

import '../../../display_all_orders/domain/entities/order_entity.dart';
import '../entities/filter_type.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class FilterOrders
    implements UseCase<Map<FilterType, List<OrderEntity>>, Params> {
  final FilterOrdersRepository repo;

  FilterOrders({required this.repo});
  @override
  Future<Either<Failure, Map<FilterType, List<OrderEntity>>>> call(
      Params params) {
    return Future.value(repo.filterOrders(params.toBeFiltered));
  }
}

class Params extends Equatable {
  final List<OrderEntity> toBeFiltered;
  const Params({
    required this.toBeFiltered,
  });

  @override
  List<Object> get props => [toBeFiltered];
}
