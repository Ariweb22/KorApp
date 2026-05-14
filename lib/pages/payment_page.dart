import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {

  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() =>
      _PaymentPageState();
}

class _PaymentPageState
    extends State<PaymentPage> {

  final nombreController =
      TextEditingController();

  final tarjetaController =
      TextEditingController();

  final fechaController =
      TextEditingController();

  final cvvController =
      TextEditingController();

  int metodoPago = 1;

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context).colorScheme;

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Método de Pago",
        ),
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            // RESUMEN
            Container(

              width: double.infinity,

              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(

                color: theme.primary,

                borderRadius:
                    BorderRadius.circular(20),

              ),

              child: const Column(

                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(

                    "Resumen de Donación",

                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 15),

                  Row(

                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,

                    children: [

                      Text(
                        "Apoyo Comunitario",
                      ),

                      Text(
                        "\$500",
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // TARJETA
            const Text(

              "Número de Tarjeta",

              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            TextField(

              controller: tarjetaController,

              keyboardType:
                  TextInputType.number,

              decoration: InputDecoration(

                hintText:
                    "1234 5678 9012 3456",

                border: OutlineInputBorder(

                  borderRadius:
                      BorderRadius.circular(12),

                ),
              ),
            ),

            const SizedBox(height: 20),

            // TITULAR
            const Text(

              "Nombre del Titular",

              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            TextField(

              controller: nombreController,

              decoration: InputDecoration(

                hintText:
                    "Nombre Completo",

                border: OutlineInputBorder(

                  borderRadius:
                      BorderRadius.circular(12),

                ),
              ),
            ),

            const SizedBox(height: 20),

            // FECHA Y CVV
            Row(

              children: [

                Expanded(

                  child: TextField(

                    controller:
                        fechaController,

                    keyboardType:
                        TextInputType.number,

                    decoration: InputDecoration(

                      hintText: "MM/YY",

                      border:
                          OutlineInputBorder(

                        borderRadius:
                            BorderRadius
                                .circular(12),

                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(

                  child: TextField(

                    controller: cvvController,

                    obscureText: true,

                    keyboardType:
                        TextInputType.number,

                    decoration: InputDecoration(

                      hintText: "CVV",

                      border:
                          OutlineInputBorder(

                        borderRadius:
                            BorderRadius
                                .circular(12),

                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // METODO
            const Text(

              "Método de Pago",

              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 20),

            // VISA
            ListTile(

              leading: const Icon(
                Icons.credit_card,
              ),

              title: const Text(
                "Visa",
              ),

              trailing: Radio<int>(

                value: 1,

                groupValue: metodoPago,

                onChanged: (value) {

                  setState(() {

                    metodoPago = value!;

                  });
                },
              ),
            ),

            // MASTERCARD
            ListTile(

              leading: const Icon(
                Icons.credit_card,
              ),

              title: const Text(
                "Mastercard",
              ),

              trailing: Radio<int>(

                value: 2,

                groupValue: metodoPago,

                onChanged: (value) {

                  setState(() {

                    metodoPago = value!;

                  });
                },
              ),
            ),

            const SizedBox(height: 40),

            // BOTON PAGAR
            SizedBox(

              width: double.infinity,

              child: ElevatedButton(

                style:
                    ElevatedButton.styleFrom(

                  padding:
                      const EdgeInsets.symmetric(
                    vertical: 18,
                  ),

                  shape:
                      RoundedRectangleBorder(

                    borderRadius:
                        BorderRadius.circular(15),

                  ),
                ),

                onPressed: () {

                  // VALIDAR CAMPOS
                  if (

                    tarjetaController.text.isEmpty ||

                    nombreController.text.isEmpty ||

                    fechaController.text.isEmpty ||

                    cvvController.text.isEmpty

                  ) {

                    ScaffoldMessenger.of(context)
                        .showSnackBar(

                      const SnackBar(

                        content: Text(
                          "Completa todos los campos",
                        ),
                      ),
                    );

                    return;
                  }

                  // IR A COMPROBANTE
                  Navigator.pushNamed(
                    context,
                    '/comprobante_page',
                  );
                },

                child: const Text(

                  "Confirmar Donación",

                  style: TextStyle(
                    fontSize: 16,
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