import 'package:bikex/models/cart_item.dart';
import 'package:bikex/models/food.dart';
import 'package:bikex/models/restaurant.dart';
import 'package:flutter/material.dart';

class RestaurantHandler extends ChangeNotifier {
  List<Restaurant> restaurantList = [
    Restaurant(
      restaurantName: 'Waakye Supreme',
      restaurantImage:
          "https://images.bolt.eu/store/2022/2022-02-09/0007c966-0747-4e5b-842c-beddf6b776af.jpeg",
      rating: 4,
      deliveryTime: "30 mins",
      isFreeDelivery: true,
      restaurantCategories: "Fast Food",
      foodList: [],
    ),
    Restaurant(
      restaurantName: 'Pizza Palace',
      restaurantImage:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGARNcg22HO5RZdURE8nl_ppn7ZX2rAtXyow&s",
      rating: 5,
      deliveryTime: "45 mins",
      isFreeDelivery: false,
      restaurantCategories: "Pizza",
      foodList: [],
    ),
  ];

  RestaurantHandler() {
    // Initialize relationships dynamically for all restaurants
    for (var restaurant in restaurantList) {
      // Add foods dynamically to each restaurant
      if (restaurant.restaurantName == "Waakye Supreme") {
        restaurant.addFood(
          Food(
            foodTitle: "Jollof Rice",
            foodImage:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScVNVvymzdm9IHeq9REMYRky2CILFnbtJDMQ&s",
            price: 70,
            restaurant: restaurant,
          ),
        );
        restaurant.addFood(
          Food(
              foodTitle: "Beans and Gari",
              foodImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHllcw0H5cCzTH2-ZU25Lm-SUKcBlwMaCLCstawlIHKJMKTBGF_z_f5rt9tQ5tcpyNBdY&usqp=CAU",
              price: 50,
              restaurant: restaurant),
        );
      } else if (restaurant.restaurantName == "Pizza Palace") {
        restaurant.addFood(
          Food(
              foodTitle: "Pepperoni Pizza",
              foodImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5ask8c39yQLLJYEXGXsq9ajVwRYjkEPjhJA&s",
              price: 120,
              restaurant: restaurant),
        );
        restaurant.addFood(
          Food(
            foodTitle: "Margherita Pizza",
            foodImage:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5ask8c39yQLLJYEXGXsq9ajVwRYjkEPjhJA&s",
            price: 100,
            restaurant: restaurant,
          ),
        );
      }
    }
  }
  List<CartItem> cartItems = [];
  bool isAlreadyInCart = false;

  void addToCart(Food food) {
    // Check if the food item already exists in the cart
    isAlreadyInCart = cartItems.any((item) => item.food == food);
    if (!isAlreadyInCart) {
      cartItems.add(CartItem(food: food, quantity: 1));

      notifyListeners(); // Notify listeners that the cart has changed
    } else {
      notifyListeners();
    }
  }

  void increaseQuantity(Food food) {
    for (var item in cartItems) {
      if (item.food == food) {
        item.quantity++;
        notifyListeners(); // 🔥 This triggers a rebuild
        break;
      }
    }
  }

  void decreaseQuantity(Food food) {
    for (var item in cartItems) {
      if (item.food == food && item.quantity > 1) {
        item.quantity--;
        notifyListeners();
        break;
      }
    }
  }

  void removeFromCart(Food food) {
    cartItems.removeWhere((element) => element.food == food);
    notifyListeners();
  }

  double getTotal() {
    double total = 0;
    for (var item in cartItems) {
      total += item.food.price * item.quantity;
    }
    return total;
  }

  void placeorder() {}

  void payment() {}
  //getter methods
  List<Food> getAllFood() {
    List<Food> popularFood = [];
    for (var restaurant in restaurantList) {
      popularFood.addAll(restaurant.foodList);
    }
    return popularFood;
  }

  List<CartItem> getCartItems() {
    return cartItems;
  }
}
