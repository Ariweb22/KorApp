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

    // EVENTOS APOYADOS
    final carrito = context.watch<Tienda>().carrito;

    return Scaffold(

      appBar: AppBar(

        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: theme.inversePrimary,

        title: const Text('Mis Apoyos'),

      ),

      backgroundColor: theme.surface,

      drawer: MiMenu(),

      body: carrito.isEmpty

          ? const Center(
              child: Text(
                'Aún no has apoyado ningún evento',
              ),
            )

          : ListView.builder(

              itemCount: carrito.length,

              itemBuilder: (context, index) {

                final item = carrito[index];

                return Card(

                  margin: const EdgeInsets.all(12),

                  child: ListTile(

                    leading: Image.asset(
                      item.rutaImagen,
                      width: 50,
                    ),

                    title: Text(item.nombre),

                    subtitle: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        Text(item.fecha),

                        Text(item.lugar),

                      ],
                    ),

                    trailing: IconButton(

                      onPressed: () =>
                          eliminarApoyo(context, item),

                      icon: const Icon(Icons.delete),

                    ),
                  ),
                );
              },
            ),
    );
  }

  // ELIMINAR APOYO
  void eliminarApoyo(BuildContext context, Producto item) {

    showDialog(

      context: context,

      builder: (_) => AlertDialog(

        title: const Text("Eliminar apoyo"),

        content: const Text(
          '¿Deseas eliminar este evento de tus apoyos?',
        ),

        actions: [

          MaterialButton(

            onPressed: () => Navigator.pop(context),

            child: const Text('Cancelar'),

          ),

          MaterialButton(

            onPressed: () {

              Navigator.pop(context);

              context.read<Tienda>().eliminarDelCarrito(item);

            },

            child: const Text('Eliminar'),

          ),
        ],
      ),
    );
  }
}