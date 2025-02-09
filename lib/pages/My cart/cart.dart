import 'package:bikex/components/mycart/cart_item_comp.dart';
import 'package:bikex/data/restaurant_handler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  VoidCallback onEdit;
  CartPage({super.key, required this.onEdit});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantHandler>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            style: IconButton.styleFrom(backgroundColor: Colors.grey[200]),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Cart',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            TextButton(
              onPressed: widget.onEdit,
              child: Text(
                'EDIT ITEMS',
                style: TextStyle(
                    color: Colors.orange, fontWeight: FontWeight.bold),
              ),
            ),
          ],
          elevation: 0,
        ),
        body: Column(
          children: [
            // Item list section
            Expanded(
              child: ListView.builder(
                itemCount: value
                    .getAllFood()
                    .length, // Placeholder for the number of items
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: CartItem(
                      food: value.getAllFood()[index],
                      isEdit: false,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
