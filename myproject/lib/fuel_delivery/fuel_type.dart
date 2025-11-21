import 'package:flutter/material.dart';
import '../my_widgets/my_button_design.dart';
import '../my_widgets/my_logo_text.dart';

class FuelType extends StatelessWidget {
   const FuelType({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
          ),
        ),
        centerTitle: true,
        title: const MyLogoText(textSize: 30),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyButtonDesign(
                buttonWidth: MediaQuery.of(context).size.width / 1.7,
                buttonHeight: MediaQuery.of(context).size.width / 7.5,
                buttonText: 'Fuel',
                bColor: Colors.teal,
                tColor: Colors.white,
                tSize: 20, function: () {  },
              ),
              const SizedBox(height: 20,),
              MyButtonDesign(
                buttonWidth: MediaQuery.of(context).size.width / 1.7,
                buttonHeight: MediaQuery.of(context).size.width / 7.5,
                buttonText: 'Accessories',
                bColor: Colors.black,
                tColor: Colors.white,
                tSize: 20, function: () {  },
              ),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
