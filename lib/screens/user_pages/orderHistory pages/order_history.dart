import 'package:bikex/components/order_history/order_item_component.dart';
import 'package:bikex/data/restaurant_handler.dart';
import 'package:bikex/models/order.dart';
import 'package:flutter/material.dart';


class HistoryOrders extends StatefulWidget {
  const HistoryOrders({super.key});

  @override
  State<HistoryOrders> createState() => _HistoryOrdersState();
}

class _HistoryOrdersState extends State<HistoryOrders> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        OrderItemComponent(
          order: Order(
              orderId: "#2000",
              items: [],
              totalPrice: 40,
              deliveryAddress: "",
              restaurant: RestaurantHandler().restaurantList[0]),
              isCompleted: true,
        ),
      ],
    );
  }
}
