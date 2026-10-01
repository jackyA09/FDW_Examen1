import 'package:flutter/material.dart';
import 'package:prac2/features/items/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestor Personal',
      theme: ThemeData(primaryColor: const Color.fromARGB(255, 11, 117, 179)),
      home: const HomeScreen(),
    );
  }
}
