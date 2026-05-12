import 'package:flutter/material.dart';

class MiTextField extends StatelessWidget {

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const MiTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {

    return TextField(

      controller: controller,
      obscureText: obscureText,

      decoration: InputDecoration(

        hintText: hintText,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),

        filled: true,

      ),
    );
  }
}