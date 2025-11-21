import 'package:flutter/material.dart';

class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField( {
    super.key,
    required this.textHind,
    required this.textControl, required this.valid,
  });

  final String? textHind;
  final TextEditingController textControl;
  final FormFieldValidator valid;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: valid ,
      controller: textControl,
      decoration: InputDecoration(
        hintText: textHind,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 0.2,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        fillColor: Colors.white70,
        filled: true,
      ),
    );
  }
}
