import 'package:e401_ecommerce/models/tienda.dart';
import 'package:e401_ecommerce/pages/cart_page.dart';
import 'package:e401_ecommerce/pages/intro_page.dart';
import 'package:e401_ecommerce/pages/settings_page.dart';
import 'package:e401_ecommerce/pages/shop_page.dart';
import 'package:e401_ecommerce/themes/dark_mode.dart';
import 'package:e401_ecommerce/themes/light_mode.dart';
import 'package:e401_ecommerce/pages/register_page.dart';
import 'package:e401_ecommerce/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Tienda()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: themeProvider.themeData.brightness==Brightness.dark
        ? ThemeMode.dark
        : ThemeMode.light,
      routes: {
                '/intro_page': (context) => IntroPage(),
                '/shop_page': (_) => ShopPage(),
                '/cart_page': (_) => CartPage(),
                '/settings_page': (_) => SettingsPage(),
                '/register_page': (_) => RegisterPage(),
      },
    );
  }
}
