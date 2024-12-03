import 'package:bikex/models/food.dart';

class Restaurant{
  String restaurantName;
  String restaurantImage;
  double rating;
  String deliveryTime;
  bool isFreeDelivery;
  String restaurantCategories;
  List<Food> foodList;

  Restaurant({
    required this.restaurantName,
    required this.restaurantImage,
    required this.rating,
    required this.deliveryTime,
    required this.isFreeDelivery,
    required this.restaurantCategories,
    required this.foodList,
  });
}