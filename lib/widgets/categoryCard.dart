import 'package:flutter/material.dart';
import 'package:recipes_app/widgets/ingredientRow.dart';

class Categorycard extends StatelessWidget {
  final String area;
  final String image;
  final String descreption;
  final String categoryName;

  const Categorycard({
    super.key,
    required this.area,
    required this.image,
    required this.descreption,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // لو عايز ارتفاع ثابت لكل كارد:
      height: 500,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 3,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة ثابتة الارتفاع
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: Image.network(
                image,
                width: double.infinity,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),

            // باقي المحتوى مع padding داخلي
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(area, style: const TextStyle(color: Colors.grey)),
                  const SizedBox(height: 6),
                  Text(categoryName, style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 12),
                  const Text(
                    'Description',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    descreption,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
