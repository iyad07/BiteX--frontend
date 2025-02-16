import 'package:bikex/models/cart_item.dart';

import 'package:flutter/material.dart';

class CartItemComp extends StatefulWidget {
  final CartItem cartItem;
  final bool isEdit;

  const CartItemComp(
      {super.key, required this.cartItem, required this.isEdit});

  @override
  State<CartItemComp> createState() => _CartItemState();
}

class _CartItemState extends State<CartItemComp> {
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
                image: NetworkImage(widget.cartItem.food.foodImage!),
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
                widget.cartItem.food.restaurant!.restaurantName,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 8),
              Text(
                "\$${widget.cartItem.food.price}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            widget.isEdit?
            SizedBox(
              height: 27,
              width: 27,
              child: IconButton(
                iconSize: 12,
                onPressed: () {},
                icon: Icon(Icons.close, color: Colors.white,),
                style: IconButton.styleFrom(backgroundColor: Colors.red,),
              ),
            ):SizedBox(),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (widget.cartItem.quantity != 0) {
                        widget.cartItem.quantity = (widget.cartItem.quantity - 1);
                      }
                    });
                  },
                  icon: Icon(
                    Icons.remove,
                  ),
                ),
                Text(widget.cartItem.quantity.toString()),
                IconButton(
                  onPressed: () {
                    setState(() {
                      widget.cartItem.quantity = (widget.cartItem.quantity + 1);
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
