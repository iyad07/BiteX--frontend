import 'package:bikex/models/restaurant.dart';
import 'package:flutter/material.dart';

class RestaurantCard extends StatefulWidget {
  final Restaurant restaurant;

  const RestaurantCard({
    super.key,
    required this.restaurant,
  });

  @override
  State<RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(widget.restaurant.restaurantImage),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 8),
            Text(
              widget.restaurant.restaurantName,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 8),
            Text(
              widget.restaurant.restaurantCategories,
              style: TextStyle(color: Colors.grey,fontSize: 14, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 8),
            Row(
              spacing: 24,
              children: [
                Row(
                  children: [
                    Icon(Icons.star_outline, color: Colors.orange, ),
                    SizedBox(width: 8),
                    Text(widget.restaurant.rating.toString(),
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700 )),
                  ],
                ),
                widget.restaurant.isFreeDelivery ?
                  Row(
                    children: [
                      Icon(Icons.delivery_dining_outlined, color: Colors.orange,),
                      SizedBox(width: 8),
                      Text('Free',
                          style: TextStyle( fontSize: 16)),
                    ],
                  ) : SizedBox(),
                Row(
                  children: [
                    Icon(Icons.timer_outlined, color: Colors.orange, ),
                    SizedBox(width: 8),
                    Text(widget.restaurant.deliveryTime,
                        style: TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
