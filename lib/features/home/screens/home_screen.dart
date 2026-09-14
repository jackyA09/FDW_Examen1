import 'package:flutter/material.dart';
import 'package:trying_flutter/features/home/widgets/interactive_activity_card.dart';
import 'package:trying_flutter/features/home/models/activity.dart';
import 'package:trying_flutter/features/profile/screens/profile_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Activity> activityList = [
    Activity(
      title: 'Pasos Diarios',
      subtitle: 'Meta 10,000 pasos',
      icon: Icons.directions_walk,
      iconColor: Colors.blueGrey,
      trailingText: '7,500',
    ),
    Activity(
      title: 'Rutina de Fuerza',
      subtitle: 'Tren Superior / Pesas',
      icon: Icons.fitness_center,
      iconColor: Colors.black,
      trailingText: 'Pecho',
    ),
    Activity(
      title: 'Natación',
      subtitle: 'Meta 1000 metros',
      icon: Icons.pool,
      iconColor: Colors.blue,
      trailingText: '7,450',
    ),
    Activity(
      title: 'Natación',
      subtitle: 'Meta 1000 metros',
      icon: Icons.pool,
      iconColor: Colors.blue,
      trailingText: '7,450',
    ),
    Activity(
      title: 'Natación',
      subtitle: 'Meta 1000 metros',
      icon: Icons.pool,
      iconColor: Colors.blue,
      trailingText: '7,450',
    ),
    Activity(
      title: 'Natación',
      subtitle: 'Meta 1000 metros',
      icon: Icons.pool,
      iconColor: Colors.blue,
      trailingText: '7,450',
    ),
    Activity(
      title: 'Natación',
      subtitle: 'Meta 1000 metros',
      icon: Icons.pool,
      iconColor: Colors.blue,
      trailingText: '7,450',
    ),
    Activity(
      title: 'Natación',
      subtitle: 'Meta 1000 metros',
      icon: Icons.pool,
      iconColor: Colors.blue,
      trailingText: '7,450',
    ),
    Activity(
      title: 'Natación',
      subtitle: 'Meta 1000 metros',
      icon: Icons.pool,
      iconColor: Colors.blue,
      trailingText: '7,450',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[300],
        title: Text('Panel de Actividad Fisica'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          padding: EdgeInsets.all(8.0),
          itemCount: activityList.length,
          itemBuilder: (context, index) {
            final currentActivity = activityList[index];
            return InteractiveActivityCard(activity: currentActivity);
          },
        ),
      ),
    );
  }
}
