import 'package:e401_ecommerce/components/mi_boton.dart';
import 'package:e401_ecommerce/components/mi_menu.dart';
import 'package:e401_ecommerce/models/producto.dart';
import 'package:e401_ecommerce/models/tienda.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    //obtener acceso al carrito
    final carrito = context.watch<Tienda>().carrito;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: theme.inversePrimary,
        title: Text('Carrito de Compras'),
      ),
      backgroundColor: theme.surface,
      body: Column(
        children: [
          //Lista de productos en el carrito
          Expanded(
            child: carrito.isEmpty
              ? Center(child: Text('Carrito Vacio'),)
              : ListView.builder(
                  itemCount: carrito.length,
                  itemBuilder: (context, index) {
                    final item = carrito[index];

                    return ListTile(
                      title: Text(item.nombre),
                      subtitle: Text(item.precio.toStringAsFixed(2)),
                      trailing: IconButton(
                        onPressed: () => eliminarProductosDelCarrito(context, item),
                        icon: Icon(Icons.remove),
                      ),
                    );
                  },
                ),
          ),

          //Botón de Pagar
          Padding(
            padding: EdgeInsets.all(50),
            child: MiBoton(
              onTap: () => pagarBotonPresionado(context),
              child: Text('PAGAR'),
            ),
          ),
        ],
      ),
      drawer: MiMenu(),
    );
  }

  void eliminarProductosDelCarrito(BuildContext context, Producto item) {
    //mostrar cuadro de diálogo
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: Text('Eliminar este producto del carrito?'),
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
              context.read<Tienda>().eliminarDelCarrito(item);
            },
            child: Text('Si'),
          ),
        ],
      ),
    );
  }

  void pagarBotonPresionado(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('El usuario quiere pagar!! Desarrolla el backend de pago!!'),
      )
    );
  }
}
