import 'package:flutter/material.dart';

class RandomCardBody extends StatefulWidget {
  //final Meal meal;

  final String image;
  VoidCallback? onPressed;

  final String maleName;

  final String area;

  final String category;

  RandomCardBody({
    super.key,

    required this.image,

    required this.maleName,
    required this.onPressed,
    required this.area,
    required this.category,
  });

  @override
  State<RandomCardBody> createState() => _RandomCardBodyState();
}

class _RandomCardBodyState extends State<RandomCardBody> {
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
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(widget.category),
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
                      fontSize: 20,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(width: 2),
                IconButton(
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
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 110, bottom: 8),
            child: Text(widget.area),
          ),
        ],
      ),
    );
  }
}
