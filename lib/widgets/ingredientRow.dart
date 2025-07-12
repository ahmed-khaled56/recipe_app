import 'package:flutter/material.dart';

class Ingredientrow extends StatelessWidget {
  final int ingredientNum;
  final String ingrediantname;

  const Ingredientrow({
    super.key,
    required this.ingredientNum,
    required this.ingrediantname,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Ingredient$ingredientNum :",

          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 2),

        Text(" $ingrediantname"),

        const SizedBox(height: 4),
      ],
    );
  }
}
