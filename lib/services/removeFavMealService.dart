import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Removefavmealservice {
  Future<void> removeMealFromFav(String mealId) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    try {
      final snapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userId)
              .collection('favorites')
              .where('idMeal', isEqualTo: mealId)
              .get();

      for (var doc in snapshot.docs) {
        await doc.reference.delete();
      }

      print("Meal removed from favorites");
    } catch (e) {
      print("Error removing meal: $e");
    }
  }
}
