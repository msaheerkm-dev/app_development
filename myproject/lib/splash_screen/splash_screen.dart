import 'package:flutter/material.dart';
import 'package:myproject/splash_screen/splash_screen2.dart';

import '../my_widgets/my_logo.dart';


class SplashScreen extends StatefulWidget {
   const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    goToSplash2();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyLogo(),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> goToSplash2() async {
    await Future.delayed(const Duration(seconds: 2));

    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const SplashScreen2(),),);
  }
}
