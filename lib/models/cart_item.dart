import 'package:bikex/models/food.dart';

class CartItem {
  final Food food; // Reference to the food item
  late int quantity;

  CartItem({
    required this.food,
    required this.quantity,
  });
}