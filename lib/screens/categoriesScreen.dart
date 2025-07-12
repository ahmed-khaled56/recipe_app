import 'package:flutter/material.dart';
import 'package:recipes_app/widgets/categoryCard.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Categories')),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Categorycard(
            categoryName: "Beef",
            image: 'https://www.themealdb.com/images/category/beef.png',
            area: "Egypt",
            descreption:
                "with a total population of more than 19 billion as of 2011.[1] Humans commonly keep chickens as a source of food (consuming both their meat and eggs) and, more rarely, as pets.",
          );
        },
      ),
    );
  }
}
