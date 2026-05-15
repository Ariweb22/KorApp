import 'package:e401_ecommerce/components/mi_menu.dart';
import 'package:e401_ecommerce/models/tienda.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritosPage extends StatelessWidget {

  const FavoritosPage({super.key});

  @override
  Widget build(BuildContext context) {

    final favoritos =
        context.watch<Tienda>().favoritos;

    return Scaffold(

      appBar: AppBar(
        title: const Text("Favoritos"),
      ),

      drawer: const MiMenu(),

      body: favoritos.isEmpty

          ? const Center(
              child: Text(
                "No tienes favoritos",
              ),
            )

          : ListView.builder(

              itemCount: favoritos.length,

              itemBuilder: (context, index) {

                final item = favoritos[index];

                return ListTile(

                  leading: Image.asset(
                    item.rutaImagen,
                    width: 50,
                  ),

                  title: Text(item.nombre),

                  subtitle: Text(item.fecha),
                );
              },
            ),
    );
  }
}