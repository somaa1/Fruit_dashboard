
import 'order_product_entity.dart';
import 'shipping_address_entity.dart';

class OrderEntity {
  final double totalPrice;
  final String uId;
  final ShippingAddressEntity shippingAddressModel;
  final List<OrderProductEntity> orderProducts;
  final String paymentMethod;

  OrderEntity(
      {required this.totalPrice,
      required this.uId,
      required this.shippingAddressModel,
      required this.orderProducts,
      required this.paymentMethod});
}

// payment method
