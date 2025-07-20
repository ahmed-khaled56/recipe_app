import 'package:flutter/material.dart';
import 'package:recipes_app/model/recipe_model.dart';
import 'package:recipes_app/widgets/recipeDetailes.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  static String id = "DetailsScreen";

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> mealMap =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    DetailesModel meal = DetailesModel.fromJson(mealMap);
    // final  meal = ModalRoute.of(context)!.settings.arguments as dynamic;

    return Scaffold(
      appBar: AppBar(title: Text(meal.mealName)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Recipedetailes(mealDetailes: meal),
      ),
    );
  }
}
