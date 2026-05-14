import 'package:e401_ecommerce/models/producto.dart';
import 'package:e401_ecommerce/pages/detalle_evento_page.dart';

import 'package:flutter/material.dart';

class MiTarjetaProducto extends StatelessWidget {

  final Producto producto;

  const MiTarjetaProducto({
    super.key,
    required this.producto,
  });

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context).colorScheme;

    return GestureDetector(

      onTap: () {

        Navigator.push(

          context,

          MaterialPageRoute(

            builder: (context) => DetalleEventoPage(
              producto: producto,
            ),
          ),
        );
      },

      child: Container(

        margin: const EdgeInsets.all(10),

        padding: const EdgeInsets.all(20),

        width: 320,

        decoration: BoxDecoration(

          color: theme.primary,

          borderRadius: BorderRadius.circular(20),

        ),

        child: SingleChildScrollView(

          child: Column(

            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              // IMAGEN
              Container(

                height: 220,

                decoration: BoxDecoration(

                  color: theme.secondary,

                  borderRadius:
                      BorderRadius.circular(20),

                ),

                padding: const EdgeInsets.all(20),

                child: Center(

                  child: Image.asset(

                    producto.rutaImagen,

                    fit: BoxFit.contain,

                    errorBuilder:
                        (context, error, stackTrace) {

                      return const Icon(
                        Icons.image_not_supported,
                        size: 80,
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // NOMBRE
              Text(

                producto.nombre,

                style: const TextStyle(

                  fontWeight: FontWeight.bold,

                  fontSize: 22,

                ),
              ),

              const SizedBox(height: 10),

              // DESCRIPCION
              Text(

                producto.descripcion,

                style: TextStyle(

                  color: theme.inversePrimary,

                  height: 1.4,

                ),
              ),

              const SizedBox(height: 20),

              // FECHA
              Row(

                children: [

                  const Icon(
                    Icons.calendar_month,
                  ),

                  const SizedBox(width: 8),

                  Expanded(
                    child: Text(producto.fecha),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // LUGAR
              Row(

                children: [

                  const Icon(
                    Icons.location_on,
                  ),

                  const SizedBox(width: 8),

                  Expanded(
                    child: Text(producto.lugar),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // BOTON
              Container(

                width: double.infinity,

                padding:
                    const EdgeInsets.symmetric(
                  vertical: 15,
                ),

                decoration: BoxDecoration(

                  color: theme.secondary,

                  borderRadius:
                      BorderRadius.circular(15),

                ),

                child: const Center(

                  child: Text(

                    "Ver Detalles",

                    style: TextStyle(

                      fontWeight: FontWeight.bold,

                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}