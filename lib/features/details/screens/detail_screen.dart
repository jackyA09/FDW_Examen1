import 'package:flutter/material.dart';
import 'package:trying_flutter/features/home/models/activity.dart';

class DetailScreen extends StatelessWidget {
  final Activity activity;
  const DetailScreen({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.activity.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Contenido de la pantalla de detalles'),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Volver'),
            ),
          ],
        ),
      ),
    );
  }
}
