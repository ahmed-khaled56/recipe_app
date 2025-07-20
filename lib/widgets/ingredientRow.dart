import 'package:flutter/material.dart';

class Ingredientrow extends StatelessWidget {
  final dynamic ingredientNum;
  final dynamic ingrediantname;
  final dynamic meseaur;

  const Ingredientrow({
    super.key,
    required this.ingredientNum,
    required this.ingrediantname,
    required this.meseaur,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Ingredient$ingredientNum :",

          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        const SizedBox(width: 2),

        Text(ingrediantname),

        const SizedBox(width: 10),

        Text('=>'),
        const SizedBox(width: 2),

        Text(
          meseaur,

          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
