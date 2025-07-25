import 'package:flutter/material.dart';
import 'package:recipes_app/screens/Login_screen.dart';
import 'package:recipes_app/screens/One_categoryScreen.dart';
import 'package:recipes_app/screens/Register_screen.dart';
import 'package:recipes_app/screens/categoriesScreen.dart';
import 'package:recipes_app/screens/detailesScreen.dart';
import 'package:recipes_app/screens/home.dart';

void main() {
  runApp(const MealsApp());
}

class MealsApp extends StatelessWidget {
  const MealsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      debugShowCheckedModeBanner: false,
      routes: {
        CategoriesScreen.id: (context) => CategoriesScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        OneCategoryscreen.id: (context) => OneCategoryscreen(),
        DetailsScreen.id: (context) => DetailsScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
      },
      theme: ThemeData(primarySwatch: Colors.deepOrange, fontFamily: 'Poppins'),
      initialRoute: LoginScreen.id,
    );
  }
}
