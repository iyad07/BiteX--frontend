import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          Divider(height: 1, thickness: 1),
          // Menu Options
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Text('A Personal Info'),
                  onTap: () {
                    // Handle tap
                  },
                ),
                ListTile(
                  title: Text('Addresses'),
                  onTap: () {
                    // Handle tap
                  },
                ),
                ListTile(
                  title: Text('Cart'),
                  onTap: () {
                    // Handle tap
                  },
                ),
                ListTile(
                  title: Text('Favourite'),
                  onTap: () {
                    // Handle tap
                  },
                ),
                ListTile(
                  title: Text('Notifications'),
                  onTap: () {
                    // Handle tap
                  },
                ),
                ListTile(
                  title: Text('Payment Method'),
                  onTap: () {
                    // Handle tap
                  },
                ),
                ListTile(
                  title: Text('FAQs'),
                  onTap: () {
                    // Handle tap
                  },
                ),
                ListTile(
                  title: Text('User Reviews'),
                  onTap: () {
                    // Handle tap
                  },
                ),
                ListTile(
                  title: Text('Settings'),
                  onTap: () {
                    // Handle tap
                  },
                ),
                ListTile(
                  title: Text('Log Out'),
                  onTap: () {
                    // Handle tap
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}