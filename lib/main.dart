import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Features/display_all_orders/domain/usecases/get_all_orders.dart';
import 'Features/display_all_orders/presentation/cubit/display_orders_cubit.dart';
import 'Features/filter_orders/domain/usecases/filter_orders.dart';
import 'Features/filter_orders/presentation/cubit/filter_cubit.dart';
import 'core/pages/budget_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Comic Sans MS',
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          bodyMedium: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.normal,
            fontSize: 12,
          ),
        ),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => DisplayOrdersCubit(
              getAllOrders: di.sl<GetAllOrders>(),
            ),
          ),
          BlocProvider(
            create: (context) => FilterCubit(
              filterOrders: di.sl<FilterOrders>(),
            ),
          ),
        ],
        child: const BudgetPage(),
      ),
    );
  }
}
