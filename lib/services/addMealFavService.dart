import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:recipes_app/model/recipe_model.dart';

class Addmealfavservice {
  final userId = FirebaseAuth.instance.currentUser!.uid;

  Future<void> addmealToFav(DetailesModel meal) async {
    print("Current user: ${FirebaseAuth.instance.currentUser}");
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('favorites')
          .add(meal.toJson());

      print("Meal added to favorites successfully");
    } catch (e) {
      print("Error adding meal to favorites: $e");
    } //نحول الوجبة إلى Map
  }
}
