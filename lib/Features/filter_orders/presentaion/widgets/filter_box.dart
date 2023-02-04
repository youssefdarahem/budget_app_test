import '../../../display_all_orders/domain/entities/order_entity.dart';
import '../pages/filtered_page.dart';
import 'package:flutter/material.dart';

class FilterBox extends StatelessWidget {
  final double revenue;
  final String title;
  final int orderNum;
  final List<OrderEntity> filteredOrders;
  const FilterBox(
      {super.key,
      required this.revenue,
      required this.title,
      required this.orderNum,
      required this.filteredOrders});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FilteredPage(
              filteredOrders: filteredOrders,
              orderNum: orderNum,
              revenue: revenue.toInt(),
              title: title,
            ),
          ),
        );
      },
      child: Container(
        width: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 254, 209, 49),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.white),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  revenue.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                '${orderNum.toString()} Order',
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
