import 'package:flutter/material.dart';

class Activity {
  //clase
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final String trailingText;

  Activity({
    //constructor
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.trailingText,
  });
}
