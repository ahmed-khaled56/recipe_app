import 'package:recipes_app/helper/API.dart';
import 'package:recipes_app/model/recipe_model.dart';

class GetAllCategories {
  Future<List<dynamic>> getAllCategories() async {
    Map<String, dynamic> data = await API().get(
      url: "https://www.themealdb.com/api/json/v1/1/categories.php",
    );
    List<dynamic> categoriesJson = data['categories'];

    List<CategoryModel> categoriesList =
        categoriesJson.map((item) => CategoryModel.fromJson(item)).toList();

    return categoriesList;
  }
}
