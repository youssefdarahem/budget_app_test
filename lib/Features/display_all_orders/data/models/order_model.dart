import '../../../../core/utils/utils.dart';
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
    print(json['orderDateTime']);
    print(Utils.strToDateConverter(json['orderDateTime']));
    return OrderModel(
      orderNo: json['orderNo'],
      itemCount: json['orderItemsCount'],
      dateTime: Utils.strToDateConverter(json['orderDateTime']),
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
