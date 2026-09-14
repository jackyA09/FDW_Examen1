import 'package:flutter/material.dart';

class StatisticsCard extends StatelessWidget {
  final String text;

  const StatisticsCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Text(text, textAlign: TextAlign.center),
      ),
    );
  }
}
