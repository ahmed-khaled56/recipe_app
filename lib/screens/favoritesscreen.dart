import 'package:flutter/material.dart';

import 'package:recipes_app/model/recipe_model.dart';
import 'package:recipes_app/services/fetchFavMeals.dart';
import 'package:recipes_app/widgets/random_card.dart';

class FavoritesScreen extends StatelessWidget {
  static String id = "FavoritesScreen";
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favorite Meals")),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: FavoriteService().streamFavoriteMeals(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error loading favorites"));
          }

          final data = snapshot.data;

          if (data == null || data.isEmpty) {
            return Center(child: Text("No favorite meals yet"));
          }

          // تحويل الـ Map إلى موديل
          final meals =
              data.map((json) => DetailesModel.fromJson(json)).toList();

          return ListView.builder(
            itemCount: meals.length,
            itemBuilder: (context, index) {
              final meal = meals[index];
              return RandomCard(meal: meal);
            },
          );
        },
      ),
    );
  }
}
