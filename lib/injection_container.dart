import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'Features/display_all_orders/data/datasources/orders_remote_data_source.dart';
import 'Features/display_all_orders/data/repositories/get_all_orders_repository_impl.dart';
import 'Features/display_all_orders/domain/repositories/get_all_orders_repository.dart';
import 'Features/display_all_orders/domain/usecases/get_all_orders.dart';
import 'Features/display_all_orders/presentation/cubit/display_orders_cubit.dart';
import 'Features/filter_orders/data/datasources/filter_orders_data_source.dart';
import 'Features/filter_orders/data/repositories/filter_orders_repository_impl.dart';
import 'Features/filter_orders/domain/repositories/filter_orders_repository.dart';
import 'Features/filter_orders/domain/usecases/filter_orders.dart';
import 'Features/filter_orders/presentation/cubit/filter_cubit.dart';
import 'core/utils/filter_orders.dart';

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

  //! Features - Filter Orders
  sl.registerFactory(
    () => FilterCubit(
      filterOrders: sl(),
    ),
  );

  // use Case
  sl.registerLazySingleton(
    () => FilterOrders(
      repo: sl(),
    ),
  );

  // repository
  sl.registerLazySingleton<FilterOrdersRepository>(
    () => FilterOrdersRepositoryImpl(
      filterOrdersDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<FilterOrdersDataSource>(
      () => FilterOrdersDataSourceImpl(ordersFilter: sl()));

  //! External
  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton(() => OrdersFilter());
}
