import 'package:flutter/material.dart';
import 'package:recipes_app/screens/detailesScreen.dart';
import 'package:recipes_app/widgets/MaleCard.dart';

class Homegridview extends StatefulWidget {
  const Homegridview({super.key});

  @override
  State<Homegridview> createState() => _HomegridviewState();
}

class _HomegridviewState extends State<Homegridview> {
  @override
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
          child: RecipeCard(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },

            // isFavorite: isFavorite,
            image:
                "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg",
            maleName: "beqlawa",
            categoryName: "dessert",
            area: "Egypt",
          ),
        );
      },
    );
  }
}
