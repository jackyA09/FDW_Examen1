import 'package:flutter/material.dart';
import 'package:prac2/features/items/models/item.dart';

// Widget "tonto": solo recibe datos y callbacks, no maneja su propia lista.
// Sigue el mismo patrón de ActivityCard/InteractiveActivityCard visto en clase.
class ItemCard extends StatelessWidget {
  final Item item;
  final VoidCallback onTap; // qué hacer al tocar la tarjeta (navegación)
  final ValueChanged<bool> onToggleCompletado; // qué hacer al mover el switch

  const ItemCard({
    super.key,
    required this.item,
    required this.onTap,
    required this.onToggleCompletado,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: item.completado ? Colors.green.shade100 : Colors.white,
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      child: ListTile(
        title: Text(
          item.titulo,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(item.categoria),
        onTap: onTap, // navegación delegada al padre (HomeScreen)
        // uso de Switch: reemplaza el IconButton visto en clase para
        // marcar completado/pendiente con la misma lógica de estado
        trailing: Switch(
          value: item.completado,
          onChanged: onToggleCompletado,
        ),
      ),
    );
  }
}
