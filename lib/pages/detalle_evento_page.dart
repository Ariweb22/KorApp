import 'package:e401_ecommerce/components/mi_boton.dart';
import 'package:e401_ecommerce/models/producto.dart';
import 'package:e401_ecommerce/models/tienda.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetalleEventoPage extends StatelessWidget {

  final Producto producto;

  const DetalleEventoPage({
    super.key,
    required this.producto,
  });

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context).colorScheme;

    final cantidadController = TextEditingController();

    return Scaffold(

      appBar: AppBar(
        title: Text(producto.nombre),
      ),

      backgroundColor: theme.surface,

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            // IMAGEN
            ClipRRect(

              borderRadius: BorderRadius.circular(20),

              child: Image.asset(
                producto.rutaImagen,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            // TITULO
            Text(
              producto.nombre,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            IconButton(

                    onPressed: () {

                      context
                          .read<Tienda>()
                          .agregarFavorito(producto);

                      ScaffoldMessenger.of(context)
                          .showSnackBar(

                        const SnackBar(
                          content: Text(
                            "Agregado a favoritos ❤️",
                          ),
                        ),
                      );
                    },

                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ),

            const SizedBox(height: 15),

            // FECHA
            Row(
              children: [

                const Icon(Icons.calendar_month),

                const SizedBox(width: 10),

                Text(
                  producto.fecha,
                  style: const TextStyle(fontSize: 18),
                ),

              ],
            ),

            const SizedBox(height: 10),

            // LUGAR
            Row(
              children: [

                const Icon(Icons.location_on),

                const SizedBox(width: 10),

                Expanded(
                  child: Text(
                    producto.lugar,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),

              ],
            ),

            const SizedBox(height: 25),

            // DESCRIPCION
            const Text(
              "Descripción",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              producto.descripcion,
              style: TextStyle(
                fontSize: 16,
                color: theme.inversePrimary,
              ),
            ),

            const SizedBox(height: 25),

            // APOYO NECESARIO
            const Text(
              "Se necesita apoyo en:",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              producto.apoyoNecesario,
              style: TextStyle(
                fontSize: 16,
                color: theme.inversePrimary,
              ),
            ),

            const SizedBox(height: 30),

            // DONACION
            const Text(
              "Donación Monetaria",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            TextField(

              controller: cantidadController,

              keyboardType: TextInputType.number,

              decoration: InputDecoration(

                hintText: "Cantidad a donar",

                prefixIcon: const Icon(Icons.attach_money),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 35),

            // BOTON
            MiBoton(

              onTap: () {

                // VALIDAR CANTIDAD
                if (cantidadController.text.isEmpty) {

                  ScaffoldMessenger.of(context).showSnackBar(

                    const SnackBar(
                      content: Text(
                        "Ingresa una cantidad para donar",
                      ),
                    ),

                  );

                  return;
                }

                // AGREGAR AL CARRITO
                context.read<Tienda>().agregarAlCarrito(producto);

                // IR A PAGOS
                Navigator.pushNamed(
                  context,
                  '/payment_page',
                );

              },

              child: const Text(
                "Continuar al Pago",
              ),
            ),

            const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}