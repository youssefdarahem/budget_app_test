import 'package:budget_app_test/Features/filter_orders/presentaion/widgets/filter_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Features/display_all_orders/domain/entities/order_entity.dart';
import 'Features/display_all_orders/domain/usecases/get_all_orders.dart';
import 'Features/display_all_orders/presentation/cubit/display_orders_cubit.dart';
import 'Features/display_all_orders/presentation/widgets/order_item.dart';
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
        child: const MyHomePage(),
      ),
    );
  }
}

//TODO: refactor and move to seperate wadget
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
              height: size.height * 0.25,
              color: const Color.fromARGB(255, 255, 190, 25),
              child: Padding(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Business Name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 30.0),
                        child:
                            BlocBuilder<DisplayOrdersCubit, DisplayOrdersState>(
                          builder: (context, state) {
                            if (state is Loading || state is Initial) {
                              return const CircularProgressIndicator();
                            } else if (state is Loaded) {
                              return ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  FilterBox(
                                    title: 'Today\'s Revenue',
                                    revenue: 732.00,
                                    orderNum: 5,
                                    filteredOrders: state.orders,
                                  ),
                                  const SizedBox(width: 10),
                                  FilterBox(
                                    title: 'Week so Far',
                                    revenue: 1531.00,
                                    orderNum: 10,
                                    filteredOrders: state.orders,
                                  ),
                                  const SizedBox(width: 10),
                                  FilterBox(
                                    title: 'Monthly Revenue',
                                    revenue: 3200.00,
                                    orderNum: 18,
                                    filteredOrders: state.orders,
                                  ),
                                ],
                              );
                            } else {
                              return const Text('Error');
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Stack(
              children: [
                BlocBuilder<DisplayOrdersCubit, DisplayOrdersState>(
                  builder: (context, state) {
                    if (state is Loading || state is Initial) {
                      return SizedBox(
                        height: size.height * 0.75,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else if (state is Loaded) {
                      List<OrderEntity> orders = state.orders;
                      List<Widget> ordersWidget = mapOrdersToWidget(orders);
                      return Container(
                        height: size.height * 0.75,
                        child: ListView.builder(
                          itemCount: ordersWidget.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 10),
                              child: ordersWidget[index],
                            );
                          },
                        ),
                      );
                    } else {
                      return SizedBox(
                        height: size.height * 0.75,
                        child: const Center(
                          child: Text('Hello'),
                        ),
                      );
                    }
                  },
                ),
                //TODO: add the icons to the bottom navigation bar
                Positioned.fill(
                  top: size.height * 0.65,
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

  List<Widget> mapOrdersToWidget(List<OrderEntity> orders) {
    List<Widget> ordersWidget = orders.map((order) {
      return OrderItem(order: order);
    }).toList();

    return ordersWidget;
  }
}
