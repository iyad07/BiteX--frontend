import 'package:bikex/components/mycart/cart_item.dart';
import 'package:bikex/data/restaurant_handler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantHandler>(builder: (context,value,child)=> Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
        title: Text(
          'Cart',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'EDIT ITEMS',
              style:
                  TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
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
              itemCount: value.getAllFood().length, // Placeholder for the number of items
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: CartItem(food: value.getAllFood()[index])
                );
              },
            ),
          ),
          // Delivery address section
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'DELIVERY ADDRESS',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'EDIT',
                        style: TextStyle(color: Colors.orange),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  height: 48,
                  color: Colors.grey[800], // Placeholder for address field
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'TOTAL:',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Breakdown >',
                        style: TextStyle(color: Colors.orange),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 80,
                      height: 24,
                      color: Colors.grey[800], // Placeholder for total price
                    ),
                    SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 12.0),
                        child: Text('PLACE ORDER'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
