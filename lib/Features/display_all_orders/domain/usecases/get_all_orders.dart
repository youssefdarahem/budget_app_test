import '../entities/order_entity.dart';
import '../repositories/get_all_orders_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
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
