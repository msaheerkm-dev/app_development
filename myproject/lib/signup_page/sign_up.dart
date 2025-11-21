import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myproject/homepage/home_page.dart';

import '../my_widgets/my_button_design.dart';
import '../my_widgets/my_password_field.dart';
import '../my_widgets/primary_textfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String username = "", email = "", password = "";

  final TextEditingController nameController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  registration()  async {
    if (password!=null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "No User Found for that Email",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),),);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      } on FirebaseException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            (
              const SnackBar(
                content: Text(
                  'Password Provided is too weak',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            ) as SnackBar,
          );
        } else if (e.code == "email-already-in-use") {}
        ScaffoldMessenger.of(context).showSnackBar(
          (
            const SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                'Account already exists',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
          ) as SnackBar,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Form(
                key: _formkey,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign up',
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Create your account',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  PrimaryTextField(
                    textHind: 'username',
                    textControl: nameController,
                    valid: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter  username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 27,
                  ),
                  PrimaryTextField(
                    textHind: 'Email',
                    textControl: mailController,
                    valid: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter E-mail';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 27,
                  ),
                  MyPasswordField(
                    textHind: 'password',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter password';
                      }
                      return null;
                    },
                    controler: passwordController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    const Spacer(),
                    MyButtonDesign(
                      buttonWidth: MediaQuery.of(context).size.width / 1.5,
                      buttonHeight: MediaQuery.of(context).size.height / 15,
                      buttonText: 'Sign up',
                      bColor: Colors.tealAccent,
                      tColor: Colors.black,
                      tSize: 20,
                      function: () async {
                        if (_formkey.currentState!.validate()) {
                          setState(() {
                            email = mailController.text;
                            username = nameController.text;
                            password = passwordController.text;
                          });
                        }
                        registration();
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'or',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    MyButtonDesign(
                      buttonWidth: MediaQuery.of(context).size.width / 2,
                      buttonHeight: MediaQuery.of(context).size.height / 18,
                      buttonText: 'Sign up with Google',
                      bColor: Colors.black,
                      tColor: Colors.white,
                      tSize: 15,
                      function: () {},
                    ),
                    const Spacer(),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          'Login',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
