import 'package:flutter/material.dart';

class Malecardbody extends StatefulWidget {
  //final Meal meal;

  final String image;
  VoidCallback? onPressed;
  final bool isFavorite;

  final String maleName;

  Malecardbody({
    super.key,

    required this.image,

    required this.maleName,
    required this.onPressed,
    required this.isFavorite,
  });

  @override
  State<Malecardbody> createState() => _MalecardbodyState();
}

class _MalecardbodyState extends State<Malecardbody> {
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
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    widget.maleName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(width: 2),
                IconButton(
                  icon: Icon(
                    widget.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: widget.isFavorite ? Colors.red : Colors.grey,
                  ),
                  onPressed: widget.onPressed,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
