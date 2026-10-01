import 'package:flutter/material.dart';
import 'package:prac2/features/items/models/item.dart';

// Pantalla secundaria: Stateless porque solo muestra info recibida,
// no necesita cambiar nada por sí misma. Mismo patrón que DetailScreen
// visto en clase (Activity -> DetailScreen).
class ItemDetailScreen extends StatelessWidget {
  final Item item;
  const ItemDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.titulo),
        // No se agrega manualmente el botón de "volver": Flutter lo pone
        // automáticamente porque esta pantalla se alcanzó con Navigator.push.
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.titulo,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Categoría: ${item.categoria}',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const Divider(thickness: 1, height: 32), // uso de Divider
            Row(
              children: [
                Icon(
                  item.completado ? Icons.check_circle : Icons.cancel_outlined,
                  color: item.completado ? Colors.green : Colors.red,
                ),
                const SizedBox(width: 8),
                Text(
                  item.completado ? 'Completado' : 'Pendiente',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Volver'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
