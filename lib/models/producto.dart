class Producto {

  final String nombre;
  final double? precio;

  final String descripcion;
  final String rutaImagen;

  final String fecha;
  final String lugar;
  final String apoyoNecesario;

  // NUEVO
  final double progreso;

  Producto({

    required this.nombre,
    this.precio,

    required this.descripcion,
    required this.rutaImagen,

    required this.fecha,
    required this.lugar,
    required this.apoyoNecesario,

    required this.progreso,

  });
}