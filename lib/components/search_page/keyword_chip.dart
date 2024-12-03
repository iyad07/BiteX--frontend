import 'package:flutter/material.dart';

class KeywordChip extends StatelessWidget {
  final String label;
  const KeywordChip({super.key,required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      shape: StadiumBorder(side: BorderSide(color:Color.fromARGB(153, 231, 231, 231),width: 2)),
      backgroundColor: Colors.white,
    );
  }
}