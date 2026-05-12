import 'package:e401_ecommerce/models/producto.dart';
import 'package:flutter/material.dart';

class Tienda extends ChangeNotifier {
  //Lista de productos
  final List<Producto> _tienda = [
    Producto(
      nombre: 'Producto 1',
      precio: 99.99,
      descripcion: 'Velit duis eiusmod magna esse tempor amet.',
      rutaImagen: 'assets/glasses.png',
    ),
    Producto(
      nombre: 'Producto 2',
      precio: 99.99,
      descripcion: 'Et Lorem reprehenderit consequat velit.',
      rutaImagen: 'assets/hoodie.png',
    ),
    Producto(
      nombre: 'Producto 3',
      precio: 99.99,
      descripcion: 'Laborum tempor aute esse excepteur nulla nulla laboris anim elit nisi ea fugiat amet.',
      rutaImagen: 'assets/shoes.png',
    ),
    Producto(
      nombre: 'Producto 4',
      precio: 99.99,
      descripcion: 'Non et fugiat do qui est do est cillum velit culpa laboris in excepteur ex.',
      rutaImagen: 'assets/watch.png',
    ),
  ];

  //Carrito de compras del usuario
  List<Producto> _carrito = [];

  //Obtener la lista de productos
  List<Producto> get tienda => _tienda;

  //Obtener el carrito de compras
  List<Producto> get carrito => _carrito;

  //método para agregar productos al carrito
  void agregarAlCarrito(Producto producto) {
    _carrito.add(producto);
    notifyListeners();
  }

  //Método para eliminar productos del carrito
  void eliminarDelCarrito(Producto producto) {
    _carrito.remove(producto);
    notifyListeners();
  }
}
