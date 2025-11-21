import 'package:flutter/material.dart';
import 'package:myproject/login_page/login_page.dart';
import 'package:myproject/signup_page/sign_up.dart';
import '../homepage/home_page.dart';
import '../my_widgets/my_button_design.dart';
import '../my_widgets/my_logo.dart';

class SignPage extends StatelessWidget {
  const SignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          const MyLogo(),
          const Spacer(),
          Center(
              child: MyButtonDesign(
            buttonWidth: MediaQuery.of(context).size.width / 4,
            buttonHeight: MediaQuery.of(context).size.height / 16,
            buttonText: 'Sign up',
            bColor: Colors.teal,
            tColor: Colors.white,
            tSize: 14,
            function: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUp(),
                ),
              );
            },
          ),),
          const SizedBox(
            height: 25,
          ),
          MyButtonDesign(
            buttonWidth: MediaQuery.of(context).size.width / 4,
            buttonHeight: MediaQuery.of(context).size.height / 16,
            buttonText: 'Sign in',
            bColor: Colors.black,
            tColor: Colors.white,
            tSize: 14,
            function: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
