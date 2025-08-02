import 'package:recipes_app/helper/API.dart';

class GetDetailesservice {
  Future<Map<String, dynamic>> getDetailes({required String mealName}) async {
    Map<String, dynamic> detailesListJson = await API().get(
      url: "https://www.themealdb.com/api/json/v1/1/search.php?s=$mealName",
    );

    final detailesList = detailesListJson["meals"];

    // List<DetailesModel> AlldetailesList =
    //     detailesList.map((item) => DetailesModel.fromJson(item)).toList();
    if (detailesList != null && detailesList.isNotEmpty) {
      return detailesList[0]; // meal موجود
    } else {
      throw Exception("Meal not found");
    }
  }
}
