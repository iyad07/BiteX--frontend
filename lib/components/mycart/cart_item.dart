import 'package:bikex/models/food.dart';
import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  Food food;
  int? quantity;
  bool isEdit;

  CartItem(
      {super.key, required this.food, this.quantity = 0, required this.isEdit});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001) // perspective
            ..rotateX(-0.3), // tilt backwards (negative angle)
          alignment: Alignment.center,
          child: Container(
            width: 136,
            height: 117,
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(widget.food.foodImage!),
              ),
              color: Colors.grey,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[200]!,
                  blurRadius: 30,
                  offset: Offset(12, 12),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.food.restaurant!.restaurantName,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 8),
              Text(
                "\$${widget.food.price}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 27,
              width: 27,
              child: IconButton(
                iconSize: 12,
                onPressed: () {},
                icon: Icon(Icons.close, color: Colors.white,),
                style: IconButton.styleFrom(backgroundColor: Colors.red,),
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (widget.quantity != null && widget.quantity != 0) {
                        widget.quantity = (widget.quantity! - 1);
                      }
                    });
                  },
                  icon: Icon(
                    Icons.remove,
                  ),
                ),
                Text(widget.quantity.toString()),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (widget.quantity != null) {
                        widget.quantity = (widget.quantity! + 1);
                      }
                    });
                  },
                  icon: Icon(
                    Icons.add,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
