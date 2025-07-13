import 'package:flutter/material.dart';
import 'package:recipes_app/model/recipe_model.dart';
import 'package:recipes_app/screens/categoriesScreen.dart';
import 'package:recipes_app/screens/favoritesscreen.dart';
import 'package:recipes_app/services/List_categoriesService.dart';

import 'package:recipes_app/widgets/MalesGridview.dart';
import 'package:recipes_app/widgets/searchTextField.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String id = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavoritesScreen(),
                ),
              );
            }, //=> Navigator.pushNamed(context, '/favorites'),
          ),
          IconButton(
            icon: const Icon(Icons.category),
            onPressed: () async {
              List<dynamic> categoryList =
                  await GetAllCategories().getAllCategories();
              Navigator.pushNamed(
                context,

                CategoriesScreen.id,
                arguments: categoryList,
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [Searchtextfield(), Expanded(child: Malesgridview())],
      ),
    );
  }
}
