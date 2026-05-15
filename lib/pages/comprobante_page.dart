import 'package:flutter/material.dart';

class ComprobantePage extends StatelessWidget {
  const ComprobantePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(

        child: Padding(

          padding: const EdgeInsets.all(25),

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
             children: [

              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 120,
              ),

              const SizedBox(height: 30),

              const Text(
                "Donación Exitosa",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                "Gracias por apoyar esta causa",
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),
               Container(

                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(),
                ),

                child: const Column(

                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Folio"),
                        Text("DON-2026-001"),
                      ],
                    ),

                    SizedBox(height: 15),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Monto"),
                        Text("500"),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),
ElevatedButton(

  style: ElevatedButton.styleFrom(

    backgroundColor:
        Theme.of(context).colorScheme.primary,

    foregroundColor:
        Theme.of(context).colorScheme.inversePrimary,

    padding: const EdgeInsets.symmetric(
      horizontal: 25,
      vertical: 12,
    ),

    elevation: 0,

    shape: RoundedRectangleBorder(

      borderRadius: BorderRadius.circular(12),

    ),
  ),

  onPressed: () {

    Navigator.pushNamedAndRemoveUntil(

      context,

      '/mis_donaciones_page',

      (route) => false,

    );
  },

  child: const Text(

    "Volver",

    style: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
  ),
)
            ],
          ),
        ),
      ),
    );
  }
}