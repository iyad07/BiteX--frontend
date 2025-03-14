import 'package:bikex/components/buttons.dart';
import 'package:bikex/components/mycart/cart_item_comp.dart';
import 'package:bikex/data/restaurant_handler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  final VoidCallback onEdit;
  const CartPage({super.key, required this.onEdit});

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
          leading: backButton(context),
          title: Text(
            'Cart',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            editButton(widget.onEdit)
          ],
          elevation: 0,
        ),
        body: Column(
          children: [
            // Item list section
            Expanded(
              child: ListView.builder(
                itemCount: value
                    .getCartItems()
                    .length, // Placeholder for the number of items
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: CartItemComp(
                      cartItem: value.getCartItems()[index],
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
