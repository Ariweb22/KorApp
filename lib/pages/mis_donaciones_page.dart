import 'package:flutter/material.dart';

class MisDonacionesPage extends StatelessWidget {
  const MisDonacionesPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Mis Donaciones"),
      ),

      body: ListView(

        padding: const EdgeInsets.all(20),

        children: const [

          Card(
            child: ListTile(
              leading: Icon(Icons.favorite),
              title: Text("Comedor Comunitario"),
              subtitle: Text("12 Mayo 2026"),
              trailing: Text("500"),
            ),
          ),

          SizedBox(height: 15),

          Card(
            child: ListTile(
              leading: Icon(Icons.favorite),
              title: Text("Ayuda Escolar"),
              subtitle: Text("10 Mayo 2026"),
              trailing: Text("250"),
            ),
          ),
        ],
      ),
    );
  }
}