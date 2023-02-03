import '../../domain/entities/order_entity.dart';

class OrderModel extends OrderEntity {
  const OrderModel({
    required super.orderNo,
    required super.itemCount,
    required super.dateTime,
    required super.sold,
    required super.driver,
    required super.food,
    required super.netProfit,
    required super.commission,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderNo: json['orderNo'],
      itemCount: json['orderItemsCount'],
      dateTime: json['orderDateTime'],
      sold: json['orderSold'],
      driver: json['orderDriver'],
      food: json['orderFood'],
      commission: json['orderCommission'],
      netProfit: json['orderNetProfit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "orderNo": orderNo,
      "orderItemsCount": itemCount,
      "orderDateTime": dateTime,
      "orderSold": sold,
      "orderDriver": driver,
      "orderFood": food,
      "orderCommission": commission,
      "orderNetProfit": netProfit
    };
  }
}
