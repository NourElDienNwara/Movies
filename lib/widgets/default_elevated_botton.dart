import 'package:flutter/material.dart';

class DefaultElevatedBotton extends StatelessWidget {
  
  final String label;
  final VoidCallback onPressed;

  const DefaultElevatedBotton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width, 55),
      ),
      child: Text(label),
    );
  }
}