import 'package:flutter/material.dart';

import '../my_widgets/my_button_design.dart';
import '../my_widgets/primary_textfield.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController contactNo = TextEditingController();

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
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 40,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Profile Name',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 45,
                  ),
                  PrimaryTextField(textHind: 'username', textControl: username, valid: (value) {
                    return null;
                    },),
                  const SizedBox(
                    height: 30,
                  ),
                  PrimaryTextField(textHind: 'email', textControl: email, valid: (value) {
                    return null;
                    },),
                  const SizedBox(
                    height: 30,
                  ),
                  PrimaryTextField(textHind: 'address', textControl: address, valid: (value) {
                    return null;
                    },),
                  const SizedBox(
                    height: 30,
                  ),
                  PrimaryTextField(
                      textHind: 'contact no.', textControl: contactNo, valid: (value) {
                        return null;
                        },),
                  const SizedBox(
                    height: 30,
                  ),
                  const Spacer(),
                  MyButtonDesign(
                    buttonWidth: MediaQuery.of(context).size.width / 3,
                    buttonHeight: MediaQuery.of(context).size.height / 15,
                    buttonText: 'Edit profile',
                    bColor: Colors.teal,
                    tColor: Colors.white, tSize: 16, function: () {  },
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
