import 'package:flutter/material.dart';
import 'package:recipes_app/model/recipe_model.dart';
import 'package:recipes_app/screens/detailesScreen.dart';
import 'package:recipes_app/services/addMealFavService.dart';
import 'package:recipes_app/services/removeFavMealService.dart';
import 'package:recipes_app/widgets/MaleCardBody.dart';

class Malescard extends StatefulWidget {
  Malescard({super.key, required this.oneCategory});
  DetailesModel oneCategory;

  @override
  State<Malescard> createState() => _MalescardState();
}

class _MalescardState extends State<Malescard> {
  @override
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Malecardbody(
      onPressed: () async {
        setState(() {
          isFavorite = !isFavorite;
        });
        if (isFavorite) {
          await Addmealfavservice().addmealToFav(widget.oneCategory);
        } else {
          await Removefavmealservice().removeMealFromFav(
            widget.oneCategory.idMeal,
          );
        }
      },
      isFavorite: isFavorite,

      // isFavorite: isFavorite,
      image: widget.oneCategory.maleImage,
      maleName: widget.oneCategory.mealName,
    );
  }
}
