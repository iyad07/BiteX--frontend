import 'package:bikex/components/buttons.dart';
import 'package:flutter/material.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  Widget paymentMethodtile() {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: Colors.grey[300],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          'Payment',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          // Payment methods section
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Placeholder for payment methods
                  for (int i = 0; i < 5; i++) paymentMethodtile(),
                ],
              ),
            ),
          ),
          // Card details or "Add new" section
          Expanded(
            flex: 6,
            child: Center(
              child: Container(
                height: MediaQuery.sizeOf(context).height / 3,
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 100,
                      color: Colors.grey[300], // Placeholder for card image
                    ),
                    SizedBox(height: 16),
                    Text(
                      "No card added",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      width: 266,
                      child: Text(
                        "You can add a mastercard and save it for later",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey
                        ),
                        textAlign:TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
          // Total and confirm button section
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'TOTAL:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 80,
                        height: 16,
                        color: Colors.grey[300], // Placeholder for total price
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  elevatedButton("PAY & CONFIRM", () {})
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
