import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Features/display_all_orders/presentation/cubit/display_orders_cubit.dart';
import '../../Features/display_all_orders/presentation/widgets/order_list.dart';
import '../../Features/filter_orders/presentation/widgets/filter_control.dart';
import '../widgets/bottom_navigation.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({super.key});

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
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
            FilterControlWidget(size: size),
            Stack(
              children: [
                OrdersList(size: size),
                CustomBottomNavigation(size: size),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
