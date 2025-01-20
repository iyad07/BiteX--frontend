import 'package:bikex/components/buttons.dart';
import 'package:bikex/components/checkout/card_widget.dart';
import 'package:flutter/material.dart';

class CheckOutPage extends StatefulWidget {
  bool? hasCard;
  CheckOutPage({super.key, this.hasCard = false});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  Widget paymentMethodtile() {
    return Container(
      width: 93,
      height: 85,
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.all(Radius.circular(8))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomSheet: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  'TOTAL:',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "\$90",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
            SizedBox(height: 16),
            elevatedButton("PAY & CONFIRM", () {})
          ],
        ),
      ),
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
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int i = 0; i < 3; i++) paymentMethodtile(),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                widget.hasCard!
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: ListView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            CardWidget(),
                          ],
                        ),
                      )
                    : Container(
                        height: MediaQuery.sizeOf(context).height / 3,
                        width: double.infinity,
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
                              width: 200,
                              height: 100,
                              color: Colors
                                  .grey[300], // Placeholder for card image
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
                                    color: Colors.grey),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: 16),
                          ],
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: outLinedButton("ADD NEW", () {}),
                )
              ],
            ),
          ),
          // Total and confirm button section
        ],
      ),
    );
  }
}
