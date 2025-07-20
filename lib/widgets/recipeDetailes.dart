import 'package:flutter/material.dart';
import 'package:recipes_app/model/recipe_model.dart';
import 'package:recipes_app/widgets/ingredientRow.dart';

class Recipedetailes extends StatelessWidget {
  const Recipedetailes({super.key, required this.mealDetailes});

  final DetailesModel mealDetailes;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(mealDetailes.maleImage),
        ),
        const SizedBox(height: 12),
        Text(mealDetailes.area, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 16),
        const Text(
          'Instructions',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(mealDetailes.descreption),
        const SizedBox(height: 15),

        const Text(
          'Ingredients',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),

        // for (var ingredient in mealDetailes.ingerdiants)
        //  for (var meseaur in mealDetailes.mesearus)

        //     Ingredientrow(
        //       ingrediantname: mealDetailes.ingerdiants[ingredient],
        //       ingredientNum: ingredient,
        //       meseaur:  mealDetailes.mesearus
        //     ),
        if (mealDetailes.ingerdiants != null && mealDetailes.mesearus != null)
          ...List.generate(mealDetailes.ingerdiants.length, (i) {
            final ingredient = mealDetailes.ingerdiants[i];
            final measure = mealDetailes.mesearus[i];

            if (ingredient != null && ingredient.trim().isNotEmpty) {
              return Ingredientrow(
                ingrediantname: ingredient.split(' ').take(2).join(' '),
                ingredientNum: i + 1,
                meseaur: measure ?? '',
              );
            } else {
              return const SizedBox(); // عنصر فارغ
            }
          }),
      ],
    );
  }
}
