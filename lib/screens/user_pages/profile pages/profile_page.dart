import 'package:bikex/components/buttons.dart';
import 'package:bikex/components/profile/profile_comp.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> firstGroup = [
      {'title': 'Personal Info', 'icon': Icons.person, 'onTap':(){Navigator.pushNamed(context, '/personal_profile');}},
      {'title': 'Addresses', 'icon': Icons.location_on},
    ];
    final List<Map<String, dynamic>> secondGroup = [
      
      {'title': 'Cart', 'icon': Icons.shopping_cart},
      {'title': 'Favourite', 'icon': Icons.favorite},
      {'title': 'Notifications', 'icon': Icons.notifications},
      {'title': 'Payment Method', 'icon': Icons.payment},
      
    ];
    final List<Map<String, dynamic>> thirdGroup = [
      {'title': 'FAQs', 'icon': Icons.help},
      {'title': 'User Reviews', 'icon': Icons.rate_review},
      {'title': 'Settings', 'icon': Icons.settings},
      
    ];
    final List<Map<String, dynamic>> fourthGroup = [
      {'title': 'Log Out', 'icon': Icons.logout},
    ];
    return Scaffold(
      appBar: AppBar(
        leading: backButton(context),
        title: Text('Profile'),
        
      ),
      body: Column(
        children: [
          // User Profile Section
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, size: 40, color: Colors.white),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Vishal Khadok',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'I love fast food',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Menu Options
          Expanded(
            flex: 2,
            child: profilePageGroup(firstGroup)
          ),
          SizedBox(height: 16,),
          Expanded(
            flex: 4,
            child: profilePageGroup(secondGroup)
          ),
          SizedBox(height: 16,),
          Expanded(
            flex: 3,
            child: profilePageGroup(thirdGroup)
          ),
          SizedBox(height: 16,),
          Expanded(
            flex: 1,
            child: profilePageGroup(fourthGroup)
          ),
          SizedBox(height: 16,),
        ],
      ),
    );
  }
}