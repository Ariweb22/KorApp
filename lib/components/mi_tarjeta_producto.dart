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

        decoration: BoxDecoration(
          color: theme.primary,
          borderRadius: BorderRadius.circular(20),
        ),

        width: 320,

        child: SingleChildScrollView(

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              // IMAGEN
              AspectRatio(

                aspectRatio: 1.2,

                child: Container(

                  decoration: BoxDecoration(
                    color: theme.secondary,
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: ClipRRect(

                    borderRadius: BorderRadius.circular(20),

                    child: Image.asset(

                      producto.rutaImagen,

                      fit: BoxFit.cover,

                      errorBuilder: (
                        context,
                        error,
                        stackTrace,
                      ) {

                        // PLACEHOLDER GRIS
                        return Container(

                          color: Colors.grey.shade300,

                          child: const Center(

                            child: Icon(
                              Icons.image,
                              size: 70,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // NOMBRE
              Text(

                producto.nombre,

                maxLines: 1,

                overflow: TextOverflow.ellipsis,

                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),

              const SizedBox(height: 10),

              // DESCRIPCION
              Text(

                producto.descripcion,

                maxLines: 2,

                overflow: TextOverflow.ellipsis,

                style: TextStyle(
                  color: theme.inversePrimary,
                  fontSize: 15,
                ),
              ),

              const SizedBox(height: 18),

              // FECHA
              Row(

                children: [

                  const Icon(Icons.calendar_month),

                  const SizedBox(width: 8),

                  Expanded(

                    child: Text(
                      producto.fecha,
                      overflow: TextOverflow.ellipsis,
                    ),
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

                    child: Text(
                      producto.lugar,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // PORCENTAJE
              Text(

                "${(producto.progreso * 100).toInt()}% completado",

                style: TextStyle(
                  color: theme.inversePrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              // BARRA
              ClipRRect(

                borderRadius: BorderRadius.circular(10),

                child: LinearProgressIndicator(

                  value: producto.progreso,

                  minHeight: 10,

                  backgroundColor: Colors.grey.shade300,
                ),
              ),

              const SizedBox(height: 25),

              // BOTON
              Container(

                width: double.infinity,

                padding: const EdgeInsets.symmetric(vertical: 14),

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
      ),
    );
  }
}