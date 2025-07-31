import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Isaddmealaservice {
  Future<bool> isMealFavorite(String mealId) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    final snapshot =
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection('favorites')
            .where('idMeal', isEqualTo: mealId)
            .get();

    return snapshot.docs.isNotEmpty;
  }
}
