// class recipeModel {
//   final dynamic? idMeal;
//   final dynamic? idMeal;
//   final dynamic? idMeal;
//   final dynamic? idMeal;
//   final dynamic? idMeal;

// }

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
      idCategory: jsondata(['idCategory']),
      nameCategory: jsondata(['strCategory']),
      imageCategory: jsondata(['strCategoryThumb']),
      descriptionCategory: jsondata(['strCategoryDescription']),
    );
  }
}
