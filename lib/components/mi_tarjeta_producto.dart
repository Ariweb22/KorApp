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

        // ABRIR DETALLE DEL EVENTO
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

        decoration: BoxDecoration(
          color: theme.primary,
          borderRadius: BorderRadius.circular(20),
        ),

        width: 300,

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,

          children: [

            // IMAGEN
            AspectRatio(

              aspectRatio: 1,

              child: Container(

                decoration: BoxDecoration(
                  color: theme.secondary,
                  borderRadius: BorderRadius.circular(20),
                ),

                padding: const EdgeInsets.all(20),

                child: Image.asset(

                  producto.rutaImagen,

                  fit: BoxFit.cover,

                  // SI LA IMAGEN NO EXISTE
                  errorBuilder: (
                    context,
                    error,
                    stackTrace,
                  ) {

                    return const Center(

                      child: Icon(
                        Icons.image_not_supported,
                        size: 80,
                      ),

                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            // NOMBRE EVENTO
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
              ),
            ),

            const SizedBox(height: 20),

            // FECHA
            Row(

              children: [

                const Icon(Icons.calendar_month),

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

                const Icon(Icons.location_on),

                const SizedBox(width: 8),

                Expanded(
                  child: Text(producto.lugar),
                ),

              ],
            ),

            const SizedBox(height: 20),

            // BOTON
            Container(

              width: double.infinity,

              padding: const EdgeInsets.symmetric(
                vertical: 15,
              ),

              decoration: BoxDecoration(

                color: theme.secondary,

                borderRadius: BorderRadius.circular(15),

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
    );
  }
}