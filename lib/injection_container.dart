import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'Features/display_all_orders/data/datasources/orders_remote_data_source.dart';
import 'Features/display_all_orders/data/repositories/get_all_orders_repository_impl.dart';
import 'Features/display_all_orders/domain/repositories/get_all_orders_repository.dart';
import 'Features/display_all_orders/domain/usecases/get_all_orders.dart';
import 'Features/display_all_orders/presentation/cubit/display_orders_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Get All Orders
  // cubit
  sl.registerFactory(
    () => DisplayOrdersCubit(
      getAllOrders: sl(),
    ),
  );

  // Use Cases
  sl.registerLazySingleton(() => GetAllOrders(repo: sl()));

  // Repository
  sl.registerLazySingleton<GetAllOrdersRepository>(
      () => GetAllOrdersRepositoryImpl(remoteDataSource: sl()));

  // Data sources
  sl.registerLazySingleton<OrdersRemoteDataSource>(
      () => OrdersRemoteDataSourceImpl(httpClient: sl()));

  //! External
  sl.registerLazySingleton(() => http.Client());
}
