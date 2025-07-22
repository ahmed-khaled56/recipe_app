import 'package:flutter/material.dart';

class HomeCardBody extends StatefulWidget {
  //final Meal meal;

  final String image;
  VoidCallback? onPressed;

  final String maleName;

  final String area;

  final String category;

  HomeCardBody({
    super.key,

    required this.image,

    required this.maleName,
    required this.onPressed,
    required this.area,
    required this.category,
  });

  @override
  State<HomeCardBody> createState() => _HomeCardBodyState();
}

class _HomeCardBodyState extends State<HomeCardBody> {
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
          SizedBox(width: 2),
          Text(widget.category),
          SizedBox(width: 2),
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
            padding: const EdgeInsets.only(left: 100),
            child: Text(widget.area),
          ),
        ],
      ),
    );
  }
}
