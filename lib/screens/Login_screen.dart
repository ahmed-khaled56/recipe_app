import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:recipes_app/constants.dart';
import 'package:recipes_app/helper/snack_bar_show.dart';
import 'package:recipes_app/screens/Register_screen.dart';
import 'package:recipes_app/screens/home.dart';
import 'package:recipes_app/widgets/Custom_button.dart';
import 'package:recipes_app/widgets/text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

String? email;
String? password;
bool isLoading = false;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String id = "LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Form(
            key: formkey,
            child: ListView(
              children: [
                // Image(
                //   image: AssetImage("lib/asssets/images/logjpg.jpg"),
                //   height: 100,
                // ),
                Center(
                  child: Text(
                    'Food Recipes',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 37,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Pacifico",
                    ),
                  ),
                ),
                SizedBox(height: 120),
                Row(
                  children: [
                    Text(
                      "Log In",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                textField(
                  hintText: 'Email',
                  onChange: (value) {
                    email = value;
                  },
                ),
                SizedBox(height: 20),
                textField(
                  obscureText: true,
                  hintText: "Password",
                  onChange: (value) {
                    password = value;
                  },
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    icon: Icon(Icons.login),
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});

                        try {
                          await LoginMethod();

                          Navigator.pushNamed(
                            context,
                            HomeScreen.id,
                            arguments: email,
                          );
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            showSnackBar(
                              context,
                              'No user found for that email',
                            );
                          } else if (e.code == 'wrong-password') {
                            showSnackBar(
                              context,
                              'Wrong password provided for that user.',
                            );
                          }
                        }
                        isLoading = false;
                        setState(() {});
                      } else {}
                    },
                    label: Text("Sign In"),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "don't have an account?",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 10),
                    CustomButton(
                      label: "Sign Up",
                      onPressed: () {
                        Navigator.pushNamed(context, RegisterScreen.id);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> LoginMethod() async {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email!,
    password: password!,
  );
}
