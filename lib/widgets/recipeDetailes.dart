import 'package:flutter/material.dart';
import 'package:recipes_app/widgets/ingredientRow.dart';

class Recipedetailes extends StatelessWidget {
  const Recipedetailes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            'https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg',
          ),
        ),
        const SizedBox(height: 12),
        Text('EGYPT', style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 16),
        const Text(
          'Instructions',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          "Preheat the oven to 200C/180C Fan/Gas 6. Put the biscuits in a large re-sealable freezer bag and bash with a rolling pin into fine crumbs",
        ),
        const SizedBox(height: 10),

        const Text(
          'Ingredients',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Ingredientrow(ingrediantname: "digestive biscuits", ingredientNum: 1),
        Ingredientrow(ingrediantname: "butter", ingredientNum: 2),
      ],
    );
  }
}
