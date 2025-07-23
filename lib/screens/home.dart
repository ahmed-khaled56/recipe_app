import 'package:flutter/material.dart';
import 'package:recipes_app/model/recipe_model.dart';
import 'package:recipes_app/screens/categoriesScreen.dart';
import 'package:recipes_app/screens/detailesScreen.dart';
import 'package:recipes_app/screens/favoritesscreen.dart';
import 'package:recipes_app/services/List_categoriesService.dart';
import 'package:recipes_app/services/get_detailesService.dart';
import 'package:recipes_app/services/get_random_meals.dart';

import 'package:recipes_app/widgets/home_card.dart';
import 'package:recipes_app/widgets/random_males.dart';
import 'package:recipes_app/widgets/searchTextField.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, this.RandonmMeals});
  static String id = "HomeScreen";
  final DetailesModel? RandonmMeals;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? userInput;
  DetailesModel? male;
  TextEditingController controller = TextEditingController();
  List<DetailesModel>? randomMealsList;
  void initState() {
    super.initState();
    _loadRandomMeals(); // منادي دالة الـ async
  }

  Future<void> _loadRandomMeals() async {
    try {
      final meals = await GetRandomMeals().getRandomMeals();
      setState(() {
        randomMealsList = meals;
      });
    } catch (e) {
      print('Error loading random meals: $e');
    }
  }



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
              } else {
                // لو المستخدم مسح البحث
                setState(() {
                  male = null;
                });
              }
            },
          ),

          const SizedBox(height: 16),
          Expanded(
            child:
                male != null
                    ? GestureDetector(
                      onTap: () async {
                        final meal = await GetDetailesservice().getDetailes(
                          mealName: male!.mealName,
                        );

                        Navigator.pushNamed(
                          context,
                          DetailsScreen.id,
                          arguments: meal,
                        );
                      },
                      child: HomeCard(meal: male!),
                    )
                    : randomMealsList != null
                    ? RandomMales(RandonmMeals: randomMealsList!)
                    : Center(child: const CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}
