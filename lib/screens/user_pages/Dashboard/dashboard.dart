import 'package:bikex/components/buttons.dart';
import 'package:bikex/components/dashboard/category_card.dart';
import 'package:bikex/components/dashboard/restaurant_card.dart';
import 'package:bikex/components/dashboard/search_bar.dart';
import 'package:bikex/data/restaurant_handler.dart';
import 'package:bikex/models/user.dart';
import 'package:bikex/screens/user_pages/Dashboard/search_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RestaurantDashboard extends StatefulWidget {
  final User loggedInUser;
  const RestaurantDashboard({super.key,required  this.loggedInUser});

  @override
  RestaurantDashboardState createState() => RestaurantDashboardState();
}

class RestaurantDashboardState extends State<RestaurantDashboard> {
  // Define any dynamic state variables here (e.g., selected category, list of restaurants, etc.)
  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantHandler>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leadingWidth: 56,
          leading: menuButton(context),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'DELIVER TO',
                style: TextStyle(
                    color: Colors.orange,
                    fontSize: 12,
                    fontWeight: FontWeight.w700),
              ),
              Row(
                children: [
                  Text(
                    widget.loggedInUser.address,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  DropdownButton(
                    icon: Icon(Icons.arrow_drop_down_rounded,
                        color: Colors.black),
                    items: [],
                    onChanged: (value) {},
                  )
                ],
              ),
            ],
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/my_cart');
              },
              child: Stack(
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
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    Text(
                      'Hey ${widget.loggedInUser.name}, ',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Good Afternoon!',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SearchPage()),
                        );
                      },
                      child: searchBar(enabled: false))),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'All Categories',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    textButtonIcon(
                      "See All",
                      () {},
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(left: 4),
                  height: 70,
                  child: ListView(
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    children: [
                      CategoryChip(
                        label: 'All',
                        isSelected: selectedCategory == 'All',
                        onTap: () => setState(() => selectedCategory = 'All'),
                      ),
                      CategoryChip(
                        label: 'Hot Dog',
                        isSelected: selectedCategory == 'Hot Dog',
                        onTap: () =>
                            setState(() => selectedCategory = 'Hot Dog'),
                      ),
                      CategoryChip(
                        label: 'Burger',
                        isSelected: selectedCategory == 'Burger',
                        onTap: () =>
                            setState(() => selectedCategory = 'Burger'),
                      ),
                      CategoryChip(
                        label: 'Pizza',
                        isSelected: selectedCategory == 'Pizza',
                        onTap: () => setState(() => selectedCategory = 'Pizza'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Open Restaurants',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    textButtonIcon(
                      "See All",
                      () {},
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: value.restaurantList.length,
                  itemBuilder: (context, index) => RestaurantCard(
                    onTap: () => Navigator.pushNamed(context, '/restaurant',
                        arguments: value.restaurantList[index]),
                    restaurant: value.restaurantList[index],
                  ),
                  // Add more RestaurantCard widgets here if needed.
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
