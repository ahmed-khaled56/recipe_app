import 'package:flutter/material.dart';

class Malecardbody extends StatefulWidget {
  //final Meal meal;
  final String area;
  final String image;
  VoidCallback? onPressed;

  final String categoryName;
  final String maleName;

  Malecardbody({
    super.key,
    required this.area,
    required this.image,
    required this.categoryName,
    required this.maleName,
    required this.onPressed,
  });

  @override
  State<Malecardbody> createState() => _MalecardbodyState();
}

class _MalecardbodyState extends State<Malecardbody> {
  bool isFavorite = false;

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
              widget.image,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // اسم الوصفة
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              widget.maleName,
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
                Text(widget.categoryName, style: const TextStyle(fontSize: 12)),
                Text(widget.area, style: const TextStyle(fontSize: 12)),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 30, left: 150),
            child: IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
