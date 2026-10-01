import 'package:flutter/material.dart';
import 'package:prac2/features/items/models/item.dart';
import 'package:prac2/features/items/widgets/item_card.dart';
import 'package:prac2/features/items/screens/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Lista de categorías predefinidas para el Dropdown del formulario
  final List<String> categorias = ['Videojuego', 'Libro', 'Película'];

  // Datos de ejemplo iniciales
  List<Item> itemList = [
    Item(titulo: 'Los Sims 4', categoria: 'Videojuego'),
    Item(titulo: 'El principito', categoria: 'Libro'),
    Item(titulo: 'Soy Frankelda', categoria: 'Película'),
  ];

  // Controller para el TextField del diálogo de agregar
  final TextEditingController _tituloController = TextEditingController();

  @override
  void dispose() {
    _tituloController.dispose(); // liberar el controller al destruir el widget
    super.dispose();
  }

  // --- Lógica de negocio separada del build() para mayor claridad ---

  void _eliminarItem(int index) {
    final itemEliminado =
        itemList[index]; // guardamos referencia ANTES de borrar
    setState(() {
      itemList.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text('${itemEliminado.titulo} eliminado correctamente')),
    );
  }

  void _toggleCompletado(Item item, bool nuevoValor) {
    setState(() {
      item.completado = nuevoValor;
    });
  }

  void _agregarItem(String titulo, String categoria) {
    setState(() {
      itemList.add(Item(titulo: titulo, categoria: categoria));
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$titulo agregado correctamente')),
    );
  }

  // --- Diálogo para agregar un nuevo Item ---
  void _mostrarDialogoAgregar() {
    _tituloController.clear();
    String categoriaSeleccionada =
        categorias.first; // valor inicial del Dropdown

    showDialog(
      context: context,
      builder: (dialogContext) {
        // StatefulBuilder: permite que el DropdownButton actualice su
        // selección SOLO dentro del diálogo, sin reconstruir toda la
        // pantalla de atrás (que sería el efecto de usar el setState normal).
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text('Agregar elemento'),
              content: Column(
                mainAxisSize: MainAxisSize.min, // solo el alto que necesita
                children: [
                  TextField(
                    controller: _tituloController,
                    decoration: const InputDecoration(labelText: 'Título'),
                  ),
                  const SizedBox(height: 12),
                  // uso de DropdownButton: el usuario elige de una lista
                  // predefinida en vez de escribir la categoría a mano
                  DropdownButton<String>(
                    value: categoriaSeleccionada,
                    isExpanded: true,
                    items: categorias
                        .map((cat) => DropdownMenuItem(
                              value: cat,
                              child: Text(cat),
                            ))
                        .toList(),
                    onChanged: (nuevoValor) {
                      setDialogState(() {
                        categoriaSeleccionada = nuevoValor!;
                      });
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(dialogContext),
                  child: const Text('Cancelar'),
                ),
                TextButton(
                  onPressed: () {
                    final titulo = _tituloController.text.trim();
                    if (titulo.isEmpty) return; // validación mínima
                    Navigator.pop(dialogContext); // cierra el diálogo primero
                    _agregarItem(titulo, categoriaSeleccionada);
                  },
                  child: const Text('Agregar'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 11, 117, 179),
        title: const Text('Mi Gestor Personal'),
      ),
      // uso obligatorio de ListView.builder para la interfaz dinámica
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: itemList.isEmpty
            ? const Center(
                child: Text('No hay elementos, agrega uno con el botón +'))
            : ListView.builder(
                itemCount: itemList.length,
                itemBuilder: (context, index) {
                  final currentItem = itemList[index];
                  // uso de Dismissible: deslizar para borrar
                  return Dismissible(
                    // key única por elemento: combina título + índice para
                    // que Flutter identifique exactamente cuál widget quitar
                    key: Key(currentItem.titulo + index.toString()),
                    direction: DismissDirection.horizontal,
                    onDismissed: (direction) => _eliminarItem(index),
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 20),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    secondaryBackground: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    child: ItemCard(
                      item: currentItem,
                      onTap: () {
                        // uso de Navigator.push: navega a la pantalla de detalle
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ItemDetailScreen(item: currentItem),
                          ),
                        );
                      },
                      onToggleCompletado: (nuevoValor) =>
                          _toggleCompletado(currentItem, nuevoValor),
                    ),
                  );
                },
              ),
      ),
      // uso de FloatingActionButton: abre el AlertDialog para agregar
      floatingActionButton: FloatingActionButton(
        onPressed: _mostrarDialogoAgregar,
        child: const Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 20, 156, 235),
      ),
    );
  }
}
