import 'package:e401_ecommerce/models/producto.dart';
import 'package:e401_ecommerce/models/tienda.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MiTarjetaProducto extends StatelessWidget {
  final Producto producto;

  const MiTarjetaProducto({super.key, required this.producto});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: theme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Imagen del producto
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: theme.secondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: double.infinity,
                  padding: EdgeInsets.all(25),
                  child: Image.asset(producto.rutaImagen),
                ),
              ),
            ],
          ),
          SizedBox(height: 25),

          //nombre del producto
          Text(
            producto.nombre,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(height: 10),

          //descriupción del producto
          Text(
            producto.descripcion,
            style: TextStyle(color: theme.inversePrimary),
          ),

          //precio del producto
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$${producto.precio.toStringAsFixed(2)}'),
              Container(
                decoration: BoxDecoration(
                  color: theme.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  onPressed: () => agregarAlcarrito(context),
                  icon: Icon(Icons.add),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void agregarAlcarrito(BuildContext context) {
    //Mostrar cuadro de dialogo para agregar el producto
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: Text('Agregar este producto al carrito?'),
        actions: [
          //Cancelar
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancelar'),
          ),

          //Confirmar
          MaterialButton(
            onPressed: () {
              //Cierra el diálogo
              Navigator.pop(context);

              //Agrega al carrito
              context.read<Tienda>().agregarAlCarrito(producto);
            },
            child: Text('Si'),
          ),
        ],
      ),
    );
  }
}
