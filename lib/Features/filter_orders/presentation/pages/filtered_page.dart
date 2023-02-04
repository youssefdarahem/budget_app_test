import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../Features/display_all_orders/domain/entities/order_entity.dart';
import '../../../../../Features/display_all_orders/presentation/widgets/order_item.dart';

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
    TextStyle? mainStyle =
        Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 10),
        color: const Color.fromARGB(255, 255, 190, 25),
        child: Stack(
          children: [
            Positioned(
              bottom: -150,
              right: -100,
              child: SvgPicture.asset('assets/images/Path 1.svg'),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                        Center(
                          child: Text(
                            title,
                            style:
                                mainStyle.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Spacer(
                          flex: 3,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
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
                ),
                const SizedBox(height: 5),
                const Divider(
                  color: Colors.white,
                  thickness: 2,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredOrders.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: OrderItem(order: filteredOrders[index]),
                      );
                    },
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
