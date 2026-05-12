import 'package:e401_ecommerce/components/mi_boton.dart';
import 'package:e401_ecommerce/models/producto.dart';
import 'package:flutter/material.dart';

class DetalleEventoPage extends StatelessWidget {

  final Producto producto;

  const DetalleEventoPage({
    super.key,
    required this.producto,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(producto.nombre),
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            // IMAGEN
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(producto.rutaImagen),
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

            const SizedBox(height: 15),

            // FECHA
            Text(
              "Fecha: ${producto.fecha}",
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 10),

            // LUGAR
            Text(
              "Lugar: ${producto.lugar}",
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 20),

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
              style: const TextStyle(fontSize: 16),
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
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 30),

            // DONACION MONETARIA
            const Text(
              "Donación Monetaria",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            TextField(

              keyboardType: TextInputType.number,

              decoration: InputDecoration(

                hintText: "Cantidad a donar",

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // BOTON
            MiBoton(

              onTap: () {

                showDialog(
                  context: context,
                  builder: (_) => const AlertDialog(
                    content: Text(
                      "Gracias por apoyar esta causa ❤️",
                    ),
                  ),
                );

              },

              child: const Text("Apoyar"),
            ),

          ],
        ),
      ),
    );
  }
}