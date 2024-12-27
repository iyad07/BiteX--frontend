import 'package:bikex/models/restaurant.dart';

class Food {
  String foodTitle;
  String? foodImage;
  int price;
  Restaurant? restaurant; // Reference to the parent Restaurant

  Food({
    required this.foodTitle,
    this.foodImage,
    required this.price,
    this.restaurant,
  });
}