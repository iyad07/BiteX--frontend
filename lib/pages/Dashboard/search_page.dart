import 'package:bikex/components/search_page/keyword_chip.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.all(8),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.grey[200]),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
            onPressed: () {},
          ),
        ),
        title: Text(
          'Search',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.black),
                onPressed: () {},
              ),
              Positioned(
                right: 6,
                top: 6,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '2',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Pizza',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {},
                ),
              ),
            ),

            SizedBox(height: 20),

            // Recent Keywords
            Text(
              'Recent Keywords',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: Row(
                spacing: 10,
                children: [
                  KeywordChip(label: 'Burger'),
                  KeywordChip(label: 'Sandwich'),
                  KeywordChip(label: 'Pizza'),
                  KeywordChip(label: 'Sandwich'),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Suggested Restaurants
            Text(
              'Suggested Restaurants',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                _buildRestaurantTile('Pansi Restaurant', 4.7),
                _buildRestaurantTile('American Spicy Burger Shop', 4.3),
                _buildRestaurantTile('Cafenio Coffee Club', 4.0),
              ],
            ),

            SizedBox(height: 20),

            // Popular Fast Food
            Text(
              'Popular Fast Food',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildFastFoodCard('European Pizza', 'Uttora Coffee House'),
                _buildFastFoodCard('Buffalo Pizza', 'Cafenio Coffee Club'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRestaurantTile(String name, double rating) {
    return ListTile(
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      title: Text(name),
      subtitle: Row(
        children: [
          Icon(Icons.star, color: Colors.orange, size: 16),
          SizedBox(width: 4),
          Text(rating.toString()),
        ],
      ),
    );
  }

  Widget _buildFastFoodCard(String title, String subtitle) {
    return Expanded(
      child: Container(
        height: 100,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(color: Colors.grey[600]),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
