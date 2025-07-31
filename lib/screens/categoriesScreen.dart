import 'package:flutter/material.dart';
import 'package:recipes_app/model/recipe_model.dart';
import 'package:recipes_app/screens/One_categoryScreen.dart';
import 'package:recipes_app/services/getOneCateugoryService.dart';
import 'package:recipes_app/widgets/categoryCard.dart';

class CategoriesScreen extends StatefulWidget {
  static String id = "CategoriesScreen";
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> categoryList =
        ModalRoute.of(context)!.settings.arguments as dynamic;
    return Scaffold(
      appBar: AppBar(title: Text('Categories')),
      body: ListView.builder(
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          return Builder(
            builder: (context) {
              return GestureDetector(
                onTap: () async {
                  final oneCategoryList = await Getonecateugoryservice()
                      .getOneCategory(
                        categoryName: categoryList[index].nameCategory,
                      );
                  Navigator.pushNamed(
                    context,
                    OneCategoryscreen.id,
                    arguments: oneCategoryList,
                  );
                },
                child: Categorycard(
                  categoryName: categoryList[index].nameCategory,
                  image: categoryList[index].imageCategory,

                  descreption: categoryList[index].descriptionCategory,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
