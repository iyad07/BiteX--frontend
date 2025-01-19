import 'package:flutter/material.dart';

TextButton textButton(String label, VoidCallback onClick) => TextButton(
      onPressed: onClick,
      child: Text(
        label,
        style: TextStyle(color: Colors.orange),
      ),
    );

ElevatedButton elevatedButton(String label, VoidCallback onClick) =>
    ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 24),
        minimumSize: const Size(double.infinity, 50),
      ),
      onPressed: onClick,
      child: Text(
        label,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
ElevatedButton outLinedButton(String label, VoidCallback onClick) =>
    ElevatedButton.icon(
      style: OutlinedButton.styleFrom(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
              color: Colors.grey[200]!, width: 2,), // Changed border color to orange
        ),
        padding: const EdgeInsets.symmetric(vertical: 24),
        minimumSize: const Size(double.infinity, 50),
      ),
      onPressed: onClick,
      icon: Icon(
        Icons.add,
        color: Colors.orange,
      ),
      label: Text(
        label,
        style: TextStyle(color: Colors.orange, fontSize: 16),
      ),
    );

TextButton textButtonIcon(label, onClick, Icon icon) => TextButton.icon(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 0),
      ),
      onPressed: onClick,
      iconAlignment: IconAlignment.end,
      label: Text(
        label,
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal),
      ),
      icon: icon,
    );
