import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.label, required this.onPressed});
  final String label;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(label, style: TextStyle(color: Colors.blue)),
    );
  }
}
