import 'package:budget_app_test/Features/display_all_orders/domain/entities/order_entity.dart';
import 'package:budget_app_test/Features/display_all_orders/domain/repositories/get_all_orders_repository.dart';
import 'package:budget_app_test/core/error/Failure.dart';
import 'package:budget_app_test/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetAllOrders implements UseCase<List<OrderEntity>, NoParams> {
  final GetAllOrdersRepository repo;
  GetAllOrders({
    required this.repo,
  });

  @override
  Future<Either<Failure, List<OrderEntity>>> call(NoParams _) async {
    return repo.getAllOrders();
  }
}
