import 'package:e401_ecommerce/components/mi_boton.dart';
import 'package:e401_ecommerce/components/mi_textfield.dart';
import 'package:e401_ecommerce/data/usuario_data.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {

  RegisterPage({super.key});

  final nombreController = TextEditingController();
  final apellidoController = TextEditingController();
  final edadController = TextEditingController();
  final correoController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Registro"),
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(25),

        child: Column(

          children: [

            const SizedBox(height: 20),

            // NOMBRE
            MiTextField(
              controller: nombreController,
              hintText: "Nombre",
              obscureText: false,
            ),

            const SizedBox(height: 15),

            // APELLIDO
            MiTextField(
              controller: apellidoController,
              hintText: "Apellido",
              obscureText: false,
            ),

            const SizedBox(height: 15),

            // EDAD
            MiTextField(
              controller: edadController,
              hintText: "Edad",
              obscureText: false,
            ),

            const SizedBox(height: 15),

            // SEXO
            DropdownButtonFormField(

              items: const [

                DropdownMenuItem(
                  value: "Masculino",
                  child: Text("Masculino"),
                ),

                DropdownMenuItem(
                  value: "Femenino",
                  child: Text("Femenino"),
                ),

                DropdownMenuItem(
                  value: "Otro",
                  child: Text("Otro"),
                ),

              ],

              onChanged: (value) {},

              decoration: InputDecoration(

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),

                hintText: "Sexo",

              ),
            ),

            const SizedBox(height: 15),

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

            // BOTON CREAR CUENTA
            MiBoton(

              onTap: () async {

                // GUARDAR DATOS
             await UsuarioData.guardarUsuario(
                correoController.text.trim(),
                passwordController.text.trim(),
              );

                // MENSAJE
                ScaffoldMessenger.of(context).showSnackBar(

                  const SnackBar(
                    content: Text(
                      "Cuenta creada correctamente",
                    ),
                  ),

                );

                // REGRESAR LOGIN
                Navigator.pop(context);

              },

              child: const Text(
                "Crear Cuenta",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}