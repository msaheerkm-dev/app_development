import 'package:flutter/material.dart';


class MyButtonDesign extends StatelessWidget {
  const MyButtonDesign({super.key, required this.function, required this.buttonWidth, required this.buttonHeight, required this.buttonText, required this.bColor, required this.tColor, required this.tSize});

  final VoidCallback function;
  final double buttonWidth;
  final double buttonHeight;
  final String buttonText;
  final Color bColor;
  final Color tColor;
  final double tSize;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: ElevatedButton(
        onPressed: function,
        style:  ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(bColor),
        ),
        child:  Text(
          buttonText,
          style: TextStyle(
            color: tColor,
            fontWeight: FontWeight.bold,fontSize:tSize ,
          ),
        ),
      ),
    );
  }
}
