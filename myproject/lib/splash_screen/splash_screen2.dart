
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


import '../Sign_page/sign_page.dart';
import '../my_widgets/my_logo_text.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {

  @override
  void initState() {
    goToSign();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const MyLogoText(textSize: 50),
            LoadingAnimationWidget.progressiveDots(color: Colors.white, size: 50),
          ],
        ),
      ),
    );
  }
  Future<void> goToSign() async {
    await Future.delayed(const Duration(seconds: 3));

    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const SignPage(),),);
  }
}
