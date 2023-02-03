import 'package:dartz/dartz.dart';

import '../../../../core/error/Failure.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/repositories/get_all_orders_repository.dart';
import '../datasources/orders_remote_data_source.dart';

class GetAllOrdersRepositoryImpl implements GetAllOrdersRepository {
  final OrdersRemoteDataSource remoteDataSource;

  GetAllOrdersRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<OrderEntity>>> getAllOrders() async {
    try {
      final result = await remoteDataSource.getAllOrders();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
