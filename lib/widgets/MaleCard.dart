import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  //final Meal meal;
  final String area;
  final String image;

  final String categoryName;
  final String maleName;

  RecipeCard({
    super.key,
    required this.area,
    required this.image,
    required this.categoryName,
    required this.maleName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // صورة الوصفة
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              image,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // اسم الوصفة
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              maleName,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          // التصنيف والدولة
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(categoryName, style: const TextStyle(fontSize: 12)),
                Text(area, style: const TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
