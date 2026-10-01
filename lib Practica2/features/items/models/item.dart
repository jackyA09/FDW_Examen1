// Modelo de datos: clase plana, sin lógica, igual patrón que "Activity"
class Item {
  final String titulo;
  final String categoria;
  bool completado; // no es final: esta propiedad SÍ cambia con el tiempo

  Item({
    required this.titulo,
    required this.categoria,
    this.completado = false, // valor por defecto: nace como pendiente
  });
}
