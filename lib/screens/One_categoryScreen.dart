import 'package:flutter/material.dart';
import 'package:recipes_app/model/recipe_model.dart';
import 'package:recipes_app/screens/detailesScreen.dart';
import 'package:recipes_app/services/get_detailesService.dart';
import 'package:recipes_app/widgets/MalesCard.dart';

class OneCategoryscreen extends StatefulWidget {
  const OneCategoryscreen({super.key});
  static String id = "OneCategory";

  @override
  State<OneCategoryscreen> createState() => _OneCategoryscreenState();
}

class _OneCategoryscreenState extends State<OneCategoryscreen> {
  @override
  Widget build(BuildContext context) {
    List<MealModel> oneCategoryList =
        ModalRoute.of(context)!.settings.arguments as List<MealModel>;
    return Scaffold(
      appBar: AppBar(title: const Text('Meals ')),

      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: oneCategoryList.length,
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
                mealName: oneCategoryList[i].nameMeal,
              );

              Navigator.pushNamed(
                context,

                DetailsScreen.id,
                arguments: detailes,
              );
            },

            child: Malescard(oneCategory: oneCategoryList[i]),
          );

          //
        },
      ),
    );
  }
}
