import 'package:bikex/components/buttons.dart';
import 'package:bikex/components/cred_textfields.dart';
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
    return Consumer<RestaurantHandler>(
        builder: (context, value, child) => Scaffold(
              bottomSheet: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'DELIVERY ADDRESS',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        textButton("EDIT", (){})
                      ],
                    ),
                    SizedBox(height: 8),
                    buildCredTextField("Delivery Address",hasTitle: false),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'TOTAL:',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
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
                    elevatedButton("PLACE ORDER", (){}),
                  ],
                ),
              ),
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                leading: IconButton(
                  style: IconButton.styleFrom(backgroundColor: Colors.grey[200]),
                  icon: Icon(Icons.arrow_back_ios, color: Colors.black,size: 20,),
                  onPressed: () {},
                ),
                title: Text(
                  'Cart',
                  style: TextStyle(color: Colors.black),
                ),
                actions: [
                  TextButton(
                    onPressed: () {},
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
                            child: CartItem(food: value.getAllFood()[index]));
                      },
                    ),
                  ),
                ],
              ),
            ));
  }
}
