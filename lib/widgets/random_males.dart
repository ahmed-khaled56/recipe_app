import 'package:flutter/material.dart';
import 'package:recipes_app/model/recipe_model.dart';
import 'package:recipes_app/screens/detailesScreen.dart';
import 'package:recipes_app/services/get_detailesService.dart';

import 'package:recipes_app/widgets/home_card.dart';
import 'package:recipes_app/widgets/random_card.dart';

class RandomMales extends StatelessWidget {
  const RandomMales({super.key, required this.RandonmMeals});
  static String id = "RandomMales";
  final List<DetailesModel>? RandonmMeals;

  @override
  Widget build(BuildContext context) {
    // List<MealModel> oneCategoryList =
    //     ModalRoute.of(context)!.settings.arguments as List<MealModel>;
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: RandonmMeals!.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 4,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, i) {
        return GestureDetector(
          onTap: () async {
            final detailes = await GetDetailesservice().getDetailes(
              mealName: RandonmMeals![i].mealName,
            );

            Navigator.pushNamed(context, DetailsScreen.id, arguments: detailes);
          },

          child: RandomCard(meal: RandonmMeals![i]),
        );

        //
      },
    );
  }
}
