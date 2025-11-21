import 'package:flutter/material.dart';

import '../my_widgets/my_button_design.dart';
import '../my_widgets/my_logo.dart';
import '../my_widgets/primary_textfield.dart';

class FuelAmount extends StatelessWidget {
  FuelAmount({super.key});

  final TextEditingController litre = TextEditingController();
  final TextEditingController amount = TextEditingController();
  final list = [
    'Petrol',
    'Diesel',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const MyLogo(),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Enter fuel tupe',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            DropdownButtonFormField(
              items: list.map((e) {
                return DropdownMenuItem(value: e, child: Text(e));
              }).toList(),
              onChanged: (value) {
                print(value);
              },
              borderRadius: BorderRadius.circular(20),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Enter the amount',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            PrimaryTextField(textHind: 'in Litre', textControl: litre, valid: (value) {
              return null;
              },),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'or',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            PrimaryTextField(textHind: 'in amount', textControl: amount, valid: (value) {
              return null;
              },),
            const SizedBox(
              height: 50,
            ),
            MyButtonDesign(
              buttonWidth: MediaQuery.of(context).size.width / 3,
              buttonHeight: MediaQuery.of(context).size.height / 16,
              buttonText: 'order',
              bColor: Colors.teal,
              tColor: Colors.black,
              tSize: 20, function: () {  },
            ),
          ],
        ),
      ),
    );
  }
}
