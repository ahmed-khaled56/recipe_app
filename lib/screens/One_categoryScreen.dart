import 'package:flutter/material.dart';
import 'package:recipes_app/widgets/MalesGridview.dart';

class OneCategoryscreen extends StatelessWidget {
  const OneCategoryscreen({super.key});
  static String id = "OneCategory";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meals ')),

      body: Column(children: [Expanded(child: Malesgridview())]),
    );
  }
}
