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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Placeholder for payment methods
                for (int i = 0; i < 3; i++) paymentMethodtile(),
              ],
            ),
          ),
          // Card details or "Add new" section
          Expanded(
            child: Center(
              child: Container(
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
                    Container(
                      width: double.infinity,
                      height: 16,
                      color: Colors.grey[300], // Placeholder for text
                    ),
                    SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      height: 16,
                      color: Colors.grey[300], // Placeholder for subtitle
                    ),
                    SizedBox(height: 16),
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.add, color: Colors.orange),
                      label: Text(
                        'ADD NEW',
                        style: TextStyle(color: Colors.orange),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Total and confirm button section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'TOTAL:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 80,
                      height: 16,
                      color: Colors.grey[300], // Placeholder for total price
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text('PAY & CONFIRM'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
