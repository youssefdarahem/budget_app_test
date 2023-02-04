import '../../../display_all_orders/domain/entities/order_entity.dart';
import 'package:flutter/material.dart';

import '../../../display_all_orders/presentation/widgets/order_item.dart';

class FilteredPage extends StatelessWidget {
  final List<OrderEntity> filteredOrders;
  final String title;
  final int revenue;
  final int orderNum;
  const FilteredPage(
      {super.key,
      required this.filteredOrders,
      required this.title,
      required this.revenue,
      required this.orderNum});

  @override
  Widget build(BuildContext context) {
    TextStyle mainStyle = const TextStyle(color: Colors.white);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10),
        color: const Color.fromARGB(255, 255, 190, 25),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: ButtonBar(
                alignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  //TODO: center title
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  Center(
                    child: Text(
                      title,
                      style: mainStyle.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  '${revenue.toString()} Tl',
                  style: mainStyle.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const Spacer(),
                Text(
                  '${orderNum.toString()} Order',
                  style: mainStyle,
                ),
              ],
            ),
            const SizedBox(height: 5),
            const Divider(
              color: Colors.white,
              thickness: 2,
            ),
            //TODO: add the svg background at the corner bottom
            Expanded(
              child: ListView.builder(
                itemCount: filteredOrders.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10),
                    child: OrderItem(order: filteredOrders[index]),
                  );
                },
              ),
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
