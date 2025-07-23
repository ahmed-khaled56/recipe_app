import 'package:recipes_app/helper/API.dart';
import 'package:recipes_app/model/recipe_model.dart';

class GetRandomMeals {
  Future<List<DetailesModel>> getRandomMeals() async {
    Map<String, dynamic> randomMap = await API().get(
      url: "https://themealdb.com/api/json/v1/1/search.php?f=c",
    );

    List<dynamic> RandomList = randomMap["meals"];

    List<DetailesModel> randomMealsList =
        RandomList.map((item) => DetailesModel.fromJson(item)).toList();
    return randomMealsList;
  }
}
