import 'package:flutter/material.dart';

class Searchtextfield extends StatelessWidget {
  Searchtextfield({
    super.key,
    required this.onsup,
    required this.onpressed,
    required this.controller,
  });
  final String inputUsrt = "";
  void Function(String?)? onsup;
  final TextEditingController controller;
  VoidCallback? onpressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextField(
        controller: controller,
        onSubmitted: onsup,
        decoration: InputDecoration(
          hintText: 'Search meals...',
          suffixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: onpressed, // وظيفة البحث لاحقاً
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
