import 'package:bikex/components/buttons.dart';
import 'package:bikex/components/cred_textfields.dart';
import 'package:bikex/pages/My%20cart/cart.dart';
import 'package:bikex/pages/My%20cart/edit_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCart extends StatefulWidget {
  final bool isEditPage;
  const MyCart({
    super.key,
    required this.isEditPage,
  });

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    bool isEditMode = true;

    void toggleEditMode() {
      setState(() {
        isEditMode = !isEditMode;
      });
    }

    return Consumer(
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
                  textButton("EDIT", () {})
                ],
              ),
              SizedBox(height: 8),
              buildCredTextField("Delivery Address", hasTitle: false),
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
              elevatedButton("PLACE ORDER", () {}),
            ],
          ),
        ),
        body: isEditMode
            ? EditCartPage(onDone: toggleEditMode)
            : CartPage(
                onEdit: toggleEditMode,
              ),
      ),
    );
  }
}
