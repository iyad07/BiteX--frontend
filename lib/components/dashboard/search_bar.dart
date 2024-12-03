import 'package:flutter/material.dart';

Widget searchBar() => TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16),
        prefixIcon: Icon(Icons.search),
        hintText: 'Search dishes, restaurants',
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
