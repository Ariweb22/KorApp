import 'package:e401_ecommerce/components/mi_elemento_lista.dart';

import 'package:flutter/material.dart';

class MiMenu extends StatelessWidget {

  const MiMenu({super.key});

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context).colorScheme;

    return Drawer(

      child: Column(

        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,

        children: [

          Column(

            children: [

              // LOGO
              DrawerHeader(

                child: Icon(

                  Icons.volunteer_activism,

                  size: 72,

                  color: theme.inversePrimary,

                ),
              ),

              const SizedBox(height: 20),

              // TIENDA / EVENTOS
              MiElementoLista(

                text: 'Eventos',

                icon: Icons.home,

                onTap: () {

                  // CERRAR MENU
                  Navigator.pop(context);

                  // IR A SHOP
                  Navigator.pushNamed(
                    context,
                    '/shop_page',
                  );
                },
              ),

              // CARRITO
              MiElementoLista(

                text: "Mis Apoyos",

                icon: Icons.shopping_cart,

                onTap: () {

                  Navigator.pop(context);

                  Navigator.pushNamed(
                    context,
                    '/cart_page',
                  );
                },
              ),

              // MIS DONACIONES
              MiElementoLista(

                text: "Mis Donaciones",

                icon: Icons.favorite,

                onTap: () {

                  Navigator.pop(context);

                  Navigator.pushNamed(
                    context,
                    '/mis_donaciones_page',
                  );
                },
              ),

              // PERFIL
              MiElementoLista(

                text: "Mi Perfil",

                icon: Icons.person,

                onTap: () {

                  Navigator.pop(context);

                  Navigator.pushNamed(
                    context,
                    '/perfil_page',
                  );
                },
              ),

              // CONFIGURACION
              MiElementoLista(

                text: "Configuración",

                icon: Icons.settings,

                onTap: () {

                  Navigator.pop(context);

                  Navigator.pushNamed(
                    context,
                    '/settings_page',
                  );
                },
              ),
            ],
          ),

          // SALIR
          Padding(

            padding: const EdgeInsets.only(
              bottom: 30,
            ),

            child: MiElementoLista(

              text: 'Cerrar Sesión',

              icon: Icons.logout,

              onTap: () {

                Navigator.pushNamedAndRemoveUntil(

                  context,

                  '/intro_page',

                  (route) => false,

                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
