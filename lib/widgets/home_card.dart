import 'package:flutter/material.dart';
import 'package:recipes_app/model/recipe_model.dart';
import 'package:recipes_app/screens/detailesScreen.dart';
import 'package:recipes_app/services/addMealFavService.dart';
import 'package:recipes_app/widgets/MaleCardBody.dart';
import 'package:recipes_app/widgets/home_card_body.dart';

class HomeCard extends StatefulWidget {
  HomeCard({super.key, required this.meal});
  DetailesModel meal;

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  @override
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return HomeCardBody(
      onPressed: () async {
        setState(() {
          isFavorite = !isFavorite;
        });
        if (isFavorite) {
          await Addmealfavservice().addmealToFav(widget.meal);
        }
      },
      isFavorite: isFavorite,

      // isFavorite: isFavorite,
      image: widget.meal.maleImage,
      maleName: widget.meal.mealName,
      category: widget.meal.categoryName,
      area: widget.meal.area,
    );
  }
}
