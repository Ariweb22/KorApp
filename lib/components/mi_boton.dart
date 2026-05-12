import 'package:flutter/material.dart';

class MiBoton extends StatelessWidget {
  final void Function() onTap;
  final Widget child;

  const MiBoton({
    super.key,
    required this.onTap,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: theme.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.all(25),
        child: child,
      ),
    );
  }
}
