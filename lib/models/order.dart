import 'package:bikex/models/cart_item.dart';
import 'package:bikex/models/restaurant.dart';

class Order {
  final Restaurant restaurant;
  final String orderId;
  final List<CartItem> items;
  final double totalPrice;
  final String deliveryAddress;
  final String status; // e.g., "Pending", "Completed", "Cancelled"

  Order({
    required this.restaurant,
    required this.orderId,
    required this.items,
    required this.totalPrice,
    required this.deliveryAddress,
    this.status = "Pending", // Default status
  });
}


