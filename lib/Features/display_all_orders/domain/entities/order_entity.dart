import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable {
  final String orderNo;
  final int itemCount;
  final String dateTime;
  final int sold;
  final int driver;
  final int food;
  final int netProfit;

  const OrderEntity({
    required this.orderNo,
    required this.itemCount,
    required this.dateTime,
    required this.sold,
    required this.driver,
    required this.food,
    required this.netProfit,
  });

  @override
  List<Object?> get props {
    return [
      orderNo,
      itemCount,
      dateTime,
      sold,
      driver,
      food,
      netProfit,
    ];
  }
}
