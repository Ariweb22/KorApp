import 'package:e401_ecommerce/models/producto.dart';
import 'package:flutter/material.dart';

class Tienda extends ChangeNotifier {

  // LISTA DE EVENTOS
  final List<Producto> _tienda = [

    Producto(

      nombre: "Apoyo a Comunidad",

      precio: 0,

      descripcion:
          "Evento para recolectar alimentos y ropa para familias necesitadas.",

      rutaImagen:
          "lib/images/donacion1.png",

      fecha: "25 Mayo 2026",

      lugar: "Parque Central",

      apoyoNecesario:
          "Alimentos, ropa y apoyo económico",

    ),

    Producto(

      nombre: "Ayuda Escolar",

      precio: 0,

      descripcion:
          "Recolección de útiles escolares para niños.",

      rutaImagen:
          "lib/images/donacion2.png",

      fecha: "10 Junio 2026",

      lugar: "Escuela Municipal",

      apoyoNecesario:
          "Cuadernos, mochilas y apoyo monetario",

    ),

  ];

  // EVENTOS APOYADOS
  final List<Producto> _carrito = [];

  // GETTERS
  List<Producto> get tienda => _tienda;

  List<Producto> get carrito => _carrito;

  // AGREGAR APOYO
  void agregarAlCarrito(Producto item) {

    _carrito.add(item);

    notifyListeners();
  }

  // ELIMINAR APOYO
  void eliminarDelCarrito(Producto item) {

    _carrito.remove(item);

    notifyListeners();
  }
}