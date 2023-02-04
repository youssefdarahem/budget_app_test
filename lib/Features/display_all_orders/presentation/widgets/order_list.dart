import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../filter_orders/presentation/cubit/filter_cubit.dart';
import '../../domain/entities/order_entity.dart';
import '../cubit/display_orders_cubit.dart';
import 'order_item.dart';

class OrdersList extends StatelessWidget {
  final Size size;
  const OrdersList({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    final filterCubit = context.read<FilterCubit>();
    return BlocBuilder<DisplayOrdersCubit, DisplayOrdersState>(
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
          filterCubit.filter(orders);
          List<Widget> ordersWidget = mapOrdersToWidget(orders);
          return SizedBox(
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
    );
  }

  List<Widget> mapOrdersToWidget(List<OrderEntity> orders) {
    List<Widget> ordersWidget = orders.map((order) {
      return OrderItem(order: order);
    }).toList();

    return ordersWidget;
  }
}
