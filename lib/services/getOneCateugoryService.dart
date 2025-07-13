import 'package:recipes_app/helper/API.dart';
import 'package:recipes_app/model/recipe_model.dart';

class Getonecateugoryservice {
  Future<List<dynamic>> getOneCategory({required String categoryName}) async {
    Map<String, dynamic> onecategoryList = await API().get(
      url: 'https://themealdb.com/api/json/v1/1/search.php?s=$categoryName',
    );

    List<dynamic> oneCategoriesJson = onecategoryList["meals"];

    List<MealModel> oneCategoryList =
        oneCategoriesJson.map((item) => MealModel.fromJson(item)).toList();
    return oneCategoryList;
  }
}
