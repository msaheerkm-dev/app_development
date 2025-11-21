import 'package:flutter/material.dart';

class MyPasswordField extends StatefulWidget {
  const MyPasswordField({super.key, required this.textHind, required this.validator, required this.controler,});

  final String? textHind;
  final FormFieldValidator validator;
  final TextEditingController controler;

  @override
  State<MyPasswordField> createState() => _MyInputFieldState();
}

class _MyInputFieldState extends State<MyPasswordField> {
  bool _isSecurePassword = true;

  get validator => null;

  get controler => null;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controler,
      validator: validator,
      obscureText:_isSecurePassword,
      decoration: InputDecoration(
        labelText: widget.textHind,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        fillColor: Colors.white70,
        filled: true,
        suffixIcon: togglePassword(),
      ),
    );
  }

  Widget togglePassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          _isSecurePassword = !_isSecurePassword;
        });
      },
      icon: _isSecurePassword
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off),
    );
  }
}
