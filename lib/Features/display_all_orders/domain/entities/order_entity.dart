// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable {
  final String orderNo;
  final int itemCount;
  final String dateTime;
  final int sold;
  final int driver;
  final int food;
  final int commission;
  final int netProfit;

  const OrderEntity({
    required this.orderNo,
    required this.itemCount,
    required this.dateTime,
    required this.sold,
    required this.driver,
    required this.food,
    required this.commission,
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
      commission,
      netProfit,
    ];
  }
}
