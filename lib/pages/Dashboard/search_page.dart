import 'package:bikex/components/dashboard/search_bar.dart';
import 'package:bikex/components/search_page/keyword_chip.dart';
import 'package:bikex/components/search_page/pop_food_tile.dart';
import 'package:bikex/components/search_page/sug_res__tile.dart';
import 'package:bikex/data/restaurant_handler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantHandler>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Container(
            margin: EdgeInsets.all(8),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.grey[200]),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.black,
                size: 15,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          title: Text(
            'Search',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(6),
                  margin: EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  right: 16,
                  top: 0,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '2',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Bar
                searchBar(
                ),

                SizedBox(height: 20),

                // Recent Keywords
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Recent Keywords',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Suggested Restaurants',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 264,
                  child: ListView(
                    children: [
                      SugResTile(restaurant: value.restaurantList[0]),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                // Popular Fast Food
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Popular Fast Food',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                ),
                SizedBox(height: 10),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 5/4,
                    crossAxisSpacing: 40,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: value.getAllFood().length, // Adjust this based on your data
                  itemBuilder: (context, index) {
                    return PopularFoodTile(
                      food: value.getAllFood()[index],
                      restaurant: value.restaurantList[index],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
