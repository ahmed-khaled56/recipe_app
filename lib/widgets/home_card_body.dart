import 'package:flutter/material.dart';

class HomeCardBody extends StatefulWidget {
  //final Meal meal;

  final String image;
  VoidCallback? onPressed;

  final String maleName;

  final String area;

  final bool isFavorite;
  final String category;

  HomeCardBody({
    super.key,

    required this.image,

    required this.maleName,
    required this.onPressed,
    required this.area,
    required this.category,
    required this.isFavorite,
  });

  @override
  State<HomeCardBody> createState() => _HomeCardBodyState();
}

class _HomeCardBodyState extends State<HomeCardBody> {
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
            child: Text(widget.category, style: TextStyle(fontSize: 18)),
          ),
          SizedBox(height: 10),
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

          Padding(
            padding: const EdgeInsets.only(top: 20, left: 350, bottom: 10),
            child: Text(widget.area, style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
