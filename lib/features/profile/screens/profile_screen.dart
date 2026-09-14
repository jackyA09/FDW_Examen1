import 'package:flutter/material.dart';
import 'package:trying_flutter/features/profile/widgets/statistics_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Perfil de Usuario')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // uso de CircleAvatar: avatar del usuario
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.lightBlue[100],
              child: Icon(Icons.person, size: 50, color: Colors.blueGrey),
            ),
            SizedBox(height: 12),
            Text(
              'Jacky',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            // uso de Divider: separa encabezado de estadísticas
            Divider(
              thickness: 1,
              color: Colors.grey[300],
              indent: 20, // margen desde el borde izquierdo
              endIndent: 20,
              height: 40,
            ),
            SizedBox(height: 12),
            // uso de spaceEvenly: distribuye las tarjetas horizontalmente
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StatisticsCard(text: 'Entrenamientos\ncompletados: 15'),
                StatisticsCard(text: 'Último registro:\nAbductora, 3x12'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
