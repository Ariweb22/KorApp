import 'package:e401_ecommerce/themes/dark_mode.dart';
import 'package:e401_ecommerce/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return Scaffold(
      appBar: AppBar(title: Text('Configuración')),
      body: ListTile(
        title: Text('Modo Oscuro'),
        trailing: Switch(
          value: themeProvider.themeData == darkMode,
          onChanged: (value) => themeProvider.toggleTheme()
        ),
      ),
    );
  }
}
