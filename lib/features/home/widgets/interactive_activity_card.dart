import 'package:flutter/material.dart';
import 'package:trying_flutter/features/home/models/activity.dart';
import 'package:trying_flutter/features/details/screens/detail_screen.dart';

//widget con estado
class InteractiveActivityCard extends StatefulWidget {
  final Activity activity;

  const InteractiveActivityCard({super.key, required this.activity});
  @override
  State<InteractiveActivityCard> createState() =>
      _InteractiveActivityCardState();
}

class _InteractiveActivityCardState extends State<InteractiveActivityCard> {
  bool isCompleted = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: isCompleted ? Colors.green.shade100 : Colors.white,
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(
          widget.activity.icon,
          size: 40,
          color: widget.activity.iconColor,
        ),
        title: Text(
          widget.activity.title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(isCompleted ? 'Completado' : 'Pendiente'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(activity: widget.activity),
            ),
          );
        },
        trailing: IconButton(
          onPressed: () {
            setState(() {
              isCompleted = !isCompleted;
            });
          },
          icon: Icon(
            isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
            color: isCompleted ? Colors.green : Colors.grey,
          ),
        ),
      ),
    );
  }
}
