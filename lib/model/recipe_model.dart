class DetailesModel {
  final dynamic idMeal;
  final dynamic mealName;
  final dynamic categoryName;
  final dynamic area;
  final dynamic maleImage;
  final dynamic descreption;

  final List<String> ingerdiants;
  final List<String> mesearus;
  final dynamic youtubeLink;

  DetailesModel({
    required this.mesearus,
    required this.youtubeLink,
    required this.idMeal,
    required this.mealName,
    required this.categoryName,
    required this.area,
    required this.maleImage,
    required this.descreption,
    required this.ingerdiants,
  });

  factory DetailesModel.fromJson(json) {
    List<String> ingredientsList = [];

    for (int i = 1; i <= 20; i++) {
      final ingredient = json['strIngredient$i'];
      if (ingredient != null && ingredient.toString().trim().isNotEmpty) {
        ingredientsList.add(ingredient.toString().trim());
      }
    }
    List<String> meseaursList = [];

    for (int J = 1; J <= 20; J++) {
      final mesearus = json['strMeasure$J'];
      if (mesearus != null && mesearus.toString().trim().isNotEmpty) {
        meseaursList.add(mesearus.toString().trim());
      }
    }
    return DetailesModel(
      idMeal: json['idMeal'] ?? "",
      mealName: json['strMeal'] ?? "",
      categoryName: json['strCategory'] ?? "",
      area: json['strArea'] ?? "",
      descreption: json['strInstructions'] ?? "",
      maleImage: json['strMealThumb'] ?? "",
      youtubeLink: json['strYoutube'] ?? '',
      ingerdiants: ingredientsList,
      mesearus: meseaursList,
    );
  }
}
///////////////////////////////////////////////////////

class CategoryModel {
  final dynamic idCategory;
  final dynamic nameCategory;
  final dynamic imageCategory;
  final dynamic descriptionCategory;

  CategoryModel({
    required this.idCategory,
    required this.nameCategory,
    required this.imageCategory,
    required this.descriptionCategory,
  });

  factory CategoryModel.fromJson(jsondata) {
    return CategoryModel(
      idCategory: jsondata['idCategory'] ?? "",
      nameCategory: jsondata['strCategory'] ?? "",
      imageCategory: jsondata['strCategoryThumb'] ?? "",
      descriptionCategory: jsondata['strCategoryDescription'] ?? "",
    );
  }
}

class MealModel {
  final dynamic idMeal;
  final dynamic imageMeal;
  final dynamic nameMeal;

  MealModel({
    required this.idMeal,
    required this.imageMeal,
    required this.nameMeal,
  });

  factory MealModel.fromJson(jsondata) {
    return MealModel(
      idMeal: jsondata['idMeal'] ?? "",
      imageMeal: jsondata['strMealThumb'] ?? "",
      nameMeal: jsondata['strMeal'] ?? "",
    );
  }
}
