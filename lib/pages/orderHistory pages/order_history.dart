import 'package:bikex/components/order_history/order_item_component.dart';
import 'package:bikex/data/restaurant_handler.dart';
import 'package:bikex/models/order.dart';
import 'package:flutter/material.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Orders'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Ongoing'),
              Tab(text: 'History'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            OngoingOrders(),
            HistoryOrders(),
          ],
        ),
      ),
    );
  }
}

class OngoingOrders extends StatelessWidget {
  const OngoingOrders({super.key});

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
        ),
      ],
    );
  }
}

class HistoryOrders extends StatelessWidget {
  const HistoryOrders({super.key});

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
