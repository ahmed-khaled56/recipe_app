import 'package:flutter/material.dart';

import 'package:recipes_app/model/recipe_model.dart';
import 'package:recipes_app/screens/detailesScreen.dart';
import 'package:recipes_app/services/fetchFavMeals.dart';
import 'package:recipes_app/services/get_detailesService.dart';

import 'package:recipes_app/widgets/home_card.dart';

class FavoritesScreen extends StatefulWidget {
  static String id = "FavoritesScreen";
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
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
              return GestureDetector(
                onTap: () async {
                  final meal = await GetDetailesservice().getDetailes(
                    mealName: meals[index].mealName,
                  );

                  Navigator.pushNamed(
                    context,
                    DetailsScreen.id,
                    arguments: meal,
                  );
                },
                child: HomeCard(meal: meals[index]),
              );
            },
          );
        },
      ),
    );
  }
}
