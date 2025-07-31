import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Addmealfavservice {
  final userId = FirebaseAuth.instance.currentUser!.uid;

  Future<void> addmealToFav(Map<String, dynamic> mealData) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('favorites')
        .add(mealData);
  }
}
