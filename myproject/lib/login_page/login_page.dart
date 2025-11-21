import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../my_widgets/my_button_design.dart';
import '../my_widgets/my_password_field.dart';
import '../my_widgets/primary_textfield.dart';
import '../signup_page/sign_up.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "", password = "";

  final _formkey = GlobalKey<FormState>();

  final TextEditingController userMailController = new TextEditingController();
  final TextEditingController userPasswordController =
      new TextEditingController();

  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "No User Found for that Email",
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        ))); // Text // SnackBar
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Wrong Password Provided by User",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
        ); // Text // SnackBar
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 390,
              decoration: const BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      const Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 37,
                      ),
                      PrimaryTextField(
                        textHind: 'e-mail',
                        textControl: userMailController,
                        valid: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter  E-mail';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      MyPasswordField(
                        textHind: 'password',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter  password';
                          }
                          return null;
                        },
                        controler: userPasswordController,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Forgot Password ?',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      MyButtonDesign(
                        buttonWidth: MediaQuery.of(context).size.width / 1.5,
                        buttonHeight: MediaQuery.of(context).size.height / 17,
                        buttonText: 'Login',
                        bColor: Colors.tealAccent,
                        tColor: Colors.black,
                        tSize: 17,
                        function: () async {
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              email = userMailController.text;
                              password = userPasswordController.text;
                            });
                          }
                          userLogin();
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              return SignUp();
                            }),
                          );
                        },
                        child: const Text(
                          'New User ? Sign Up',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
