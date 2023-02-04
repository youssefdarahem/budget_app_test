import 'package:flutter/material.dart';

import '../../domain/entities/order_entity.dart';

class OrderItem extends StatelessWidget {
  final OrderEntity order;
  const OrderItem({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(color: Colors.green),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              child: Row(
                children: [
                  Text(order.orderNo),
                  Spacer(),
                  Text('${order.itemCount.toString()} items'),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              child: Row(
                children: [
                  Text(order.dateTime),
                  const Spacer(),
                  RichText(
                    text: TextSpan(
                      text: 'Sold ',
                      style: const TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: order.sold.toString(),
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text('Driver'),
                        const SizedBox(height: 5),
                        Text(
                          order.driver.toString(),
                          style: TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                    const VerticalDivider(
                      thickness: 1,
                      indent: 20,
                      color: Colors.black,
                    ),
                    Column(
                      children: [
                        Text('Food'),
                        const SizedBox(height: 5),
                        Text(order.food.toString()),
                      ],
                    ),
                    const VerticalDivider(
                      thickness: 1,
                      indent: 20,
                      color: Colors.black,
                    ),
                    Column(
                      children: [
                        Text('Commission'),
                        const SizedBox(height: 5),
                        Text(order.commission.toString()),
                      ],
                    ),
                    const VerticalDivider(
                      thickness: 1,
                      indent: 20,
                      color: Colors.black,
                    ),
                    Column(
                      children: [
                        Text('Net Profit'),
                        const SizedBox(height: 5),
                        Text(order.netProfit.toString()),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
