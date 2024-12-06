import 'package:bikex/models/restaurant.dart';
import 'package:flutter/material.dart';

class RestaurantHandler extends ChangeNotifier {
  List<Restaurant> restaurantList = [
    Restaurant(
      restaurantName: 'Waakye Supreme',
      restaurantImage:
          "https://images.bolt.eu/store/2022/2022-02-09/0007c966-0747-4e5b-842c-beddf6b776af.jpeg",
      rating: 2,
      deliveryTime: "short",
      isFreeDelivery: true,
      restaurantCategories: "Fast food",
      foodList: [],
    ),
  ];
}
