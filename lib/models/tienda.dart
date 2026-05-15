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

      rutaImagen: "assets/images/donacion1.png",

      fecha: "25 Mayo 2026",

      lugar: "Parque Central",

      apoyoNecesario:
          "Alimentos, ropa y apoyo económico",

      progreso: 0.70,

    ),

    Producto(

      nombre: "Ayuda Escolar",

      precio: 0,

      descripcion:
          "Recolección de útiles escolares para niños.",

      rutaImagen: "assets/images/donacion2.png",

      fecha: "10 Junio 2026",

      lugar: "Escuela Municipal",

      apoyoNecesario:
          "Cuadernos, mochilas y apoyo monetario",

      progreso: 0.45,

    ),

  ];

  // CARRITO
  final List<Producto> _carrito = [];

  // FAVORITOS
  final List<Producto> _favoritos = [];

  // GETTERS
  List<Producto> get tienda => _tienda;

  List<Producto> get carrito => _carrito;

  List<Producto> get favoritos => _favoritos;

  // AGREGAR AL CARRITO
  void agregarAlCarrito(Producto item) {

    _carrito.add(item);

    notifyListeners();
  }

  // ELIMINAR DEL CARRITO
  void eliminarDelCarrito(Producto item) {

    _carrito.remove(item);

    notifyListeners();
  }

  // AGREGAR FAVORITO
  void agregarFavorito(Producto producto) {

    if (!_favoritos.contains(producto)) {

      _favoritos.add(producto);

      notifyListeners();
    }
  }

  // ELIMINAR FAVORITO
  void eliminarFavorito(Producto producto) {

    _favoritos.remove(producto);

    notifyListeners();
  }
}