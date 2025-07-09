import 'package:flutter/material.dart';

class Searchtextfield extends StatelessWidget {
  const Searchtextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search meals...',
          suffixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {}, // وظيفة البحث لاحقاً
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
