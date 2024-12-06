import 'package:bikex/models/restaurant.dart';

class Food {
  String foodTitle;
  String? foodImage;
  int price;
  Restaurant restaurant;
  Food({
    required this.foodTitle,
    this.foodImage,
    required this.price,
    required this.restaurant,
  });
}
