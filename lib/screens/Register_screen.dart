import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:recipes_app/constants.dart';
import 'package:recipes_app/widgets/Custom_button.dart';
import 'package:recipes_app/widgets/text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static String id = "RegisterScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? email;
  String? password;
  bool isLoading = false;
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
                //   image: AssetImage("lib/assets/images/scholar.png"),
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
                      "Register",
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
                      // if (formkey.currentState!.validate()) {
                      //   isLoading = true;
                      //   setState(() {});

                      //   try {
                      //     await RegisterMethod();
                      //     Navigator.pushNamed(context, chatPage.id,
                      //         arguments: email);
                      //   } on FirebaseAuthException catch (e) {
                      //     if (e.code == 'weak-password') {
                      //       showSnackBar(
                      //           context, 'The password provided is too weak.');
                      //     } else if (e.code == 'email-already-in-use') {
                      //       showSnackBar(context,
                      //           'The account already exists for that email.');
                      //     }
                      //   } catch (e) {
                      //     showSnackBar(
                      //         context, 'There is an error,please try later.');
                      //   }
                      //   isLoading = false;
                      //   setState(() {});
                      // } else {}
                    },
                    label: Text("Register"),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "I'm alredy have an account?",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 10),
                    CustomButton(
                      label: "Sign In",
                      onPressed: () {
                        Navigator.pop(context);
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
