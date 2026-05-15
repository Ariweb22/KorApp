import 'dart:async';

import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() =>
      _SplashPageState();
}

class _SplashPageState
    extends State<SplashPage> {

  @override
  void initState() {

    super.initState();

    Timer(

      const Duration(seconds: 3),

      () {

        Navigator.pushReplacementNamed(
          context,
          '/intro_page',
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(

        child: Column(

          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [

            Icon(
              Icons.volunteer_activism,
              size: 120,
              color: Colors.red,
            ),

            const SizedBox(height: 20),

            const Text(

              "Helping Hands",

              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}