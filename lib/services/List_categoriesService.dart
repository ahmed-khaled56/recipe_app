import 'package:recipes_app/helper/API.dart';

class GetAllCategories {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> categoriesList = await API().get(
      url: "https://www.themealdb.com/api/json/v1/1/categories.php",
    );
    return categoriesList;
  }
}
