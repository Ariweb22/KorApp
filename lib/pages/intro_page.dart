import 'package:e401_ecommerce/components/mi_boton.dart';
import 'package:e401_ecommerce/components/mi_textfield.dart';
import 'package:e401_ecommerce/data/usuario_data.dart';
import 'package:e401_ecommerce/pages/shop_page.dart';

import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {

  IntroPage({super.key});

  final correoController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context).colorScheme;

    return Scaffold(

      backgroundColor: theme.surface,

      body: SafeArea(

        child: Center(

          child: Padding(

            padding: const EdgeInsets.symmetric(horizontal: 25),

            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                // LOGO
                Icon(
                  Icons.shopping_bag,
                  size: 90,
                  color: theme.inversePrimary,
                ),

                const SizedBox(height: 25),

                // TITULO
                const Text(
                  'Tienda Minimalista',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                // SUBTITULO
                const Text(
                  'Productos Calidad Premium',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 40),

                // CORREO
                MiTextField(
                  controller: correoController,
                  hintText: "Correo",
                  obscureText: false,
                ),

                const SizedBox(height: 15),

                // PASSWORD
                MiTextField(
                  controller: passwordController,
                  hintText: "Contraseña",
                  obscureText: true,
                ),

                const SizedBox(height: 30),

                // BOTON LOGIN
                MiBoton(

                  onTap: () async {

                    // OBTENER DATOS GUARDADOS
                    final correoGuardado =
                        await UsuarioData.obtenerCorreo();

                    final passwordGuardado =
                        await UsuarioData.obtenerPassword();

                    // PRINTS DEBUG
                    print("Correo guardado: $correoGuardado");
                    print("Password guardado: $passwordGuardado");

                    // VALIDAR LOGIN
                    if (

                      correoController.text.trim() ==
                          correoGuardado.trim() &&

                      passwordController.text.trim() ==
                          passwordGuardado.trim()

                    ) {

                      // IR A SHOP PAGE
                      Navigator.push(

                        context,

                        MaterialPageRoute(

                          builder: (context) => ShopPage(),

                        ),
                      );

                    } else {

                      // ERROR LOGIN
                      ScaffoldMessenger.of(context).showSnackBar(

                        const SnackBar(

                          content: Text(
                            "Correo o contraseña incorrectos",
                          ),
                        ),
                      );
                    }
                  },

                  child: const Text(

                    "Iniciar Sesión",

                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // REGISTRO
                Row(

                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    const Text(
                      "¿No tienes cuenta? ",
                    ),

                    GestureDetector(

                      onTap: () {

                        Navigator.pushNamed(
                          context,
                          '/register_page',
                        );

                      },

                      child: const Text(

                        "Registrarse",

                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}