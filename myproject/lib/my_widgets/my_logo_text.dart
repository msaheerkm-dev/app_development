import 'package:flutter/material.dart';

class MyLogoText extends StatelessWidget {
  const MyLogoText({super.key, required this.textSize});

  final double? textSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      'PETRO',
      style: TextStyle(
          fontSize: textSize,
          shadows: const <Shadow>[
            Shadow(
              offset: Offset(2.5, 2.5),
              color: Colors.black,
            ),
          ],
          fontWeight: FontWeight.bold,
          color: Colors.white),
    );
  }
}
