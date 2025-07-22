import 'package:flutter/material.dart';
import 'package:recipes_app/model/recipe_model.dart';
import 'package:recipes_app/screens/categoriesScreen.dart';
import 'package:recipes_app/screens/detailesScreen.dart';
import 'package:recipes_app/screens/favoritesscreen.dart';
import 'package:recipes_app/services/List_categoriesService.dart';
import 'package:recipes_app/services/get_detailesService.dart';

import 'package:recipes_app/widgets/MalesCard.dart';
import 'package:recipes_app/widgets/home_card.dart';
import 'package:recipes_app/widgets/searchTextField.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  static String id = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? userInput;
  DetailesModel? male;
  TextEditingController controller = TextEditingController();

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
        children: [
          Searchtextfield(
            onsup: (v) {},
            controller: controller,

            onpressed: () async {
              final userInput = controller.text.trim();
              if (userInput.isNotEmpty) {
                try {
                  final meal = await GetDetailesservice().getDetailes(
                    mealName: userInput,
                  );
                  setState(() {
                    male = DetailesModel.fromJson(meal);
                  });
                } catch (e) {
                  setState(() {
                    male = null;
                  });
                }
              }
            },
          ),

          const SizedBox(height: 16),
          if (male != null)
            GestureDetector(
              onTap: () async {
                final meal = await GetDetailesservice().getDetailes(
                  mealName: male!.mealName,
                );

                Navigator.pushNamed(context, DetailsScreen.id, arguments: meal);
              },
              child: HomeCard(
                meal: male!,
              ), // ✅ آمن دلوقتي لأننا تأكدنا إنها مش null
            ),
          if (male == null) Text("no card"),
        ],
      ),
    );
  }
}
