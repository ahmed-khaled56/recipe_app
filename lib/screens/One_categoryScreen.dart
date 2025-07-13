import 'package:flutter/material.dart';
import 'package:recipes_app/screens/detailesScreen.dart';
import 'package:recipes_app/widgets/MalesCard.dart';

class OneCategoryscreen extends StatelessWidget {
  const OneCategoryscreen({super.key});
  static String id = "OneCategory";

  @override
  Widget build(BuildContext context) {
    List<dynamic> oneCategoryList =
        ModalRoute.of(context)!.settings.arguments as dynamic;
    return Scaffold(
      appBar: AppBar(title: const Text('Meals ')),

      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, i) {
          // final Meal meal = dummyMeals[i];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DetailsScreen()),
              );
              // arguments: meal,
            },
            child: Column(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        DetailsScreen.id,
                        arguments: oneCategoryList[i],
                      );
                    },

                    child: Malescard(oneCategory: oneCategoryList[i]),
                  ),
                ),
              ],
            ),
          );
        },
      ),

      //
    );
  }
}
