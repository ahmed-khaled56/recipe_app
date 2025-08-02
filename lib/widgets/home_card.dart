import 'package:flutter/material.dart';
import 'package:recipes_app/model/recipe_model.dart';
import 'package:recipes_app/screens/detailesScreen.dart';
import 'package:recipes_app/services/addMealFavService.dart';
import 'package:recipes_app/services/isAddMealAService.dart';
import 'package:recipes_app/services/removeFavMealService.dart';
import 'package:recipes_app/widgets/MaleCardBody.dart';
import 'package:recipes_app/widgets/home_card_body.dart';

class HomeCard extends StatefulWidget {
  HomeCard({required this.meal}) : super(key: ValueKey(meal.idMeal));
  DetailesModel meal;

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  @override
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    checkIfFavorite();
  }

  void checkIfFavorite() async {
    bool fav = await Isaddmealaservice().isMealFavorite(widget.meal.idMeal);
    if (!mounted) return;
    setState(() {
      isFavorite = fav;
    });
  }

  @override
  Widget build(BuildContext context) {
    return HomeCardBody(
      onPressed: () async {
        setState(() {
          isFavorite = !isFavorite;
        });
        if (isFavorite) {
          await Addmealfavservice().addmealToFav(widget.meal);
        } else {
          await Removefavmealservice().removeMealFromFav(widget.meal.idMeal);
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
// class HomeCard extends StatelessWidget {
//   final DetailesModel meal;
//   HomeCard({required this.meal});

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<bool>(
//       future: Isaddmealaservice().isMealFavorite(meal.idMeal),
//       builder: (context, snapshot) {
//         bool isFavorite = snapshot.data ?? false;

//         return HomeCardBody(
//           image: meal.maleImage,
//           maleName: meal.mealName,
//           category: meal.categoryName,
//           area: meal.area,
//           isFavorite: isFavorite,
//           onPressed: () async {
//             // قلب الحالة
//             bool newValue = !isFavorite;
//             if (newValue) {
//               await Addmealfavservice().addmealToFav(meal);
//             } else {
//               await Removefavmealservice().removeMealFromFav(meal.idMeal);
//             }

//             // بعد التغيير، خليه يعمل rebuild للشاشة
//             (context as Element).markNeedsBuild();
//           },
//         );
//       },
//     );
//   }
// }
