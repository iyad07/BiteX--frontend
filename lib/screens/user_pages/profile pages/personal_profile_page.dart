import 'package:bikex/components/buttons.dart';
import 'package:bikex/components/profile/profile_comp.dart';
import 'package:flutter/material.dart';

class PersonalProfilePage extends StatelessWidget {
  const PersonalProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> firstGroup = [
      {
        'title': 'FULL NAME',
        'icon': Icons.person,
        'subtitle': 'vishal vodok'
      },
      {
        'title': 'EMAIL',
        'icon': Icons.email_rounded,
        'subtitle': 'vishalvodok@gmail.com'
      },
      {
        'title': 'PHONE',
        'icon': Icons.phone_rounded,
        'subtitle': '1234567890'
      },
    ];
    return Scaffold(
      appBar: AppBar(
        leading: backButton(context),
        title: Text('Profile'),
        actions: [TextButton(
              onPressed: (){},
              child: Text(
                'EDIT',
                style: TextStyle(
                    color: Colors.orange, fontWeight: FontWeight.bold),
              ),
            ),],
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
          SizedBox(
            height: 16,
          ),
          // Menu Options
          persnalprofileGroup(firstGroup),
        ],
      ),
    );
  }
}
