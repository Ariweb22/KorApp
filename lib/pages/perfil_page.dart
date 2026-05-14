import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context).colorScheme;

    return Scaffold(

      appBar: AppBar(
        title: const Text("Mi Perfil"),
      ),
       body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            CircleAvatar(
              radius: 50,
              backgroundColor: theme.primary,
              child: const Icon(
                Icons.person,
                size: 50,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Arisalomon",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            const Text(
              "ariweb.com",
            ),

            const SizedBox(height: 40),

            Container(

              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: theme.primary,
                borderRadius: BorderRadius.circular(20),
              ),

              child: const Column(

                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Donado"),
                      Text("750"),
                    ],
                  ),

                  SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Campañas Apoyadas"),
                      Text("5"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}