import 'package:e401_ecommerce/components/mi_menu.dart';
import 'package:e401_ecommerce/components/mi_tarjeta_producto.dart';
import 'package:e401_ecommerce/models/tienda.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    //acceder a los productos de la tienda
    final productos = context.watch<Tienda>().tienda;

    return Scaffold(
      appBar: AppBar(
        title: Text('Tienda'),
        actions: [
          IconButton(
            onPressed: ()=>Navigator.pushNamed(context, '/cart_page'),
            icon: Icon(Icons.shopping_cart_checkout_outlined)
          )
        ],
      ),
      drawer: MiMenu(),
      body: ListView(
        children: [
          SizedBox(height: 25),
          Center(
            child: Text(
              'Seleeciona de la lista de Productos Premium',
              style: TextStyle(color: theme.inversePrimary)
            ),
          ),
          SizedBox(
            height: 550,
            child: ListView.builder(
              itemCount: productos.length,
              padding: EdgeInsets.all(15),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                //obtener cada uno de los productos
                final producto = productos[index];

                //regresar la tarjeta del producto UI
                return MiTarjetaProducto(producto: producto);
              },
            ),
          ),
        ],
      )
    );
  }
}
