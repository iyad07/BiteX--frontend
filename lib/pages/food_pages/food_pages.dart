import 'package:bikex/models/food.dart';
import 'package:flutter/material.dart';

class FoodPages extends StatefulWidget {
  final Food food;
  const FoodPages({super.key, required this.food});

  @override
  State<FoodPages> createState() => _FoodPagesState();
}

class _FoodPagesState extends State<FoodPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$32",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {},
                    ),
                    Text(
                      "2",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Center(
                child: Text(
                  "ADD TO CART",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Food Details",
          style: TextStyle(fontSize: 17),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          style: IconButton.styleFrom(backgroundColor: Colors.grey[100]),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.more_horiz,
            ),
            style: IconButton.styleFrom(backgroundColor: Colors.grey[100]),
            onPressed: () {
              // More options logic
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Restaurant Image
            Container(
              alignment: Alignment.bottomRight,
              width: double.infinity,
              height: 184,
              clipBehavior: Clip.none,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.food.foodImage!),
                    fit: BoxFit.fitWidth),
                borderRadius: BorderRadius.circular(16),
              ),
              child: IconButton(
                style: IconButton.styleFrom(
                    backgroundColor: Colors.grey[400],
                    foregroundColor: Colors.white),
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_outline,
                ),
              ),
            ),
            const SizedBox(height: 16),
            //Restaurant name
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 16,
                ),
                SizedBox(width: 8),
                Text(
                  widget.food.restaurant?.restaurantName ??
                      "Unknown Restaurant",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // food Details
            Text(
              widget.food.foodTitle,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 16),

            // Ratings and Info
            Row(
              children: [
                Row(
                  children: const [
                    Icon(Icons.star, color: Colors.orange, size: 20),
                    SizedBox(width: 4),
                    Text("4.7", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(width: 16),
                Row(
                  children: const [
                    Icon(Icons.local_shipping, color: Colors.orange, size: 20),
                    SizedBox(width: 4),
                    Text("Free"),
                  ],
                ),
                const SizedBox(width: 16),
                Row(
                  children: const [
                    Icon(Icons.access_time, color: Colors.orange, size: 20),
                    SizedBox(width: 4),
                    Text("20 min"),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            // Sizes
            Text(
              "SIZE:",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSizeOption("10\"", isSelected: false),
                _buildSizeOption("14\"", isSelected: true),
                _buildSizeOption("16\"", isSelected: false),
              ],
            ),
            SizedBox(height: 16),
            // Ingredients
            Text(
              "INGREDIENTS",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildIngredientIcon(Icons.local_pizza),
                _buildIngredientIcon(Icons.no_meals),
                _buildIngredientIcon(Icons.dining),
                _buildIngredientIcon(Icons.food_bank),
                _buildIngredientIcon(Icons.set_meal),
              ],
            ),
            Spacer(),
            // Price and Add to Cart
          ],
        ),
      ),
    );
  }

  Widget _buildSizeOption(String size, {bool isSelected = false}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: isSelected ? Colors.orange : Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        size,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildIngredientIcon(IconData icon) {
    return CircleAvatar(
      backgroundColor: Colors.orange[100],
      child: Icon(
        icon,
        color: Colors.orange,
      ),
    );
  }
}
