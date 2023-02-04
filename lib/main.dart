import 'package:budget_app_test/Features/display_all_orders/domain/entities/order_entity.dart';
import 'package:budget_app_test/Features/display_all_orders/presentation/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Features/display_all_orders/domain/usecases/get_all_orders.dart';
import 'Features/display_all_orders/presentation/cubit/display_orders_cubit.dart';
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
      ),
      home: BlocProvider(
        create: (context) =>
            DisplayOrdersCubit(getAllOrders: di.sl<GetAllOrders>()),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context.read<DisplayOrdersCubit>();
      cubit.fetchOrders();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: size.height * 0.3,
              color: Colors.amber,
            ),
            Stack(
              children: [
                BlocBuilder<DisplayOrdersCubit, DisplayOrdersState>(
                  builder: (context, state) {
                    if (state is Loading || state is Initial) {
                      return SizedBox(
                        height: size.height * 0.7,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else if (state is Loaded) {
                      List<OrderEntity> orders = state.orders;
                      return Container(
                        height: size.height * 0.7,
                        color: Colors.green,
                        child: ListView.builder(
                          itemCount: orders.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: OrderItem(order: orders[index]),
                            );
                          },
                        ),
                      );
                    } else {
                      return SizedBox(
                        height: size.height * 0.7,
                        child: const Center(
                          child: Text('Hello'),
                        ),
                      );
                    }
                  },
                ),
                Positioned.fill(
                  top: size.height * 0.62,
                  child: Container(
                    height: 50,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.elliptical(40.0, 40.0),
                        topRight: Radius.elliptical(40.0, 40.0),
                      ),
                      // borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(100, 0, 0, 0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
