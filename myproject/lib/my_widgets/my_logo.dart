import 'package:flutter/material.dart';
import 'my_logo_text.dart';

class MyLogo extends StatelessWidget {
  const MyLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 45,
      backgroundColor: Colors.black,
      child: CircleAvatar(
        backgroundColor: Colors.teal,
        radius: 40,
        child: MyLogoText(textSize: 20,),
      ),
    );
  }
}
