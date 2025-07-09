import 'package:flutter/material.dart';
import 'package:recipes_app/widgets/recipeDetailes.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Meal المرسل من الشاشة السابقة
    // final Meal meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(title: Text("beklawa")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Recipedetailes(),
      ),
    );
  }
}
