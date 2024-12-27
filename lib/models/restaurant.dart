import 'package:bikex/models/food.dart';

class Restaurant {
  final String restaurantName;
  final String restaurantImage;
  final int rating;
  final String deliveryTime;
  final bool isFreeDelivery;
  final String restaurantCategories;
  List<Food> foodList;

  Restaurant({
    required this.restaurantName,
    required this.restaurantImage,
    required this.rating,
    required this.deliveryTime,
    required this.isFreeDelivery,
    required this.restaurantCategories,
    List<Food>? foodList,
  }) : foodList = foodList ?? [];

  void addFood(Food food) {
    foodList.add(food);
  }
}
