import 'package:e401_ecommerce/models/tienda.dart';

import 'package:e401_ecommerce/pages/cart_page.dart';
import 'package:e401_ecommerce/pages/comprobante_page.dart';
import 'package:e401_ecommerce/pages/intro_page.dart';
import 'package:e401_ecommerce/pages/mis_donaciones_page.dart';
import 'package:e401_ecommerce/pages/payment_page.dart';
import 'package:e401_ecommerce/pages/perfil_page.dart';
import 'package:e401_ecommerce/pages/register_page.dart';
import 'package:e401_ecommerce/pages/settings_page.dart';
import 'package:e401_ecommerce/pages/shop_page.dart';

import 'package:e401_ecommerce/themes/dark_mode.dart';
import 'package:e401_ecommerce/themes/light_mode.dart';
import 'package:e401_ecommerce/themes/theme_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:provider/provider.dart';

void main() async {

  // IMPORTANTE
  WidgetsFlutterBinding.ensureInitialized();

  runApp(

    MultiProvider(

      providers: [

        ChangeNotifierProvider(
          create: (context) => Tienda(),
        ),

        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),

      ],

      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {

  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    final themeProvider =
        Provider.of<ThemeProvider>(context);

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      home: IntroPage(),

      // TEMAS
      theme: lightMode,

      darkTheme: darkMode,

      themeMode:

          themeProvider.themeData.brightness ==
                  Brightness.dark

              ? ThemeMode.dark

              : ThemeMode.light,

      // RUTAS
      routes: {

        // LOGIN
        '/intro_page': (context) => IntroPage(),

        // TIENDA
        '/shop_page': (context) => const ShopPage(),

        // CARRITO
        '/cart_page': (context) => CartPage(),

        // CONFIGURACION
        '/settings_page': (context) => SettingsPage(),

        // REGISTRO
        '/register_page': (context) => RegisterPage(),

        // PAGO
        '/payment_page': (context) => const PaymentPage(),

        // MIS DONACIONES
        '/mis_donaciones_page': (context) =>
            const MisDonacionesPage(),

        // PERFIL
        '/perfil_page': (context) =>
            const PerfilPage(),

        // COMPROBANTE
        '/comprobante_page': (context) =>
            const ComprobantePage(),
      },
    );
  }
}