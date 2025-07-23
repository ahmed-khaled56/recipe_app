import 'package:flutter/material.dart';
import 'package:recipes_app/model/recipe_model.dart';

import 'package:recipes_app/widgets/random_card_body.dart';

class RandomCard extends StatefulWidget {
  RandomCard({super.key, required this.meal});
  DetailesModel meal;

  @override
  State<RandomCard> createState() => _RandomCardState();
}

class _RandomCardState extends State<RandomCard> {
  @override
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return RandomCardBody(
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },

      // isFavorite: isFavorite,
      image: widget.meal.maleImage,
      maleName: widget.meal.mealName,
      category: widget.meal.categoryName,
      area: widget.meal.area,
    );
  }
}
