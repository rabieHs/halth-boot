import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String? Function(String?) validator;
  final TextEditingController nameController;
  final String title;
  bool? isPassword;

  CustomTextField({
    Key? key,
    this.isPassword = false,
    required this.title,
    required this.validator,
    required this.nameController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword!,
      controller: nameController,
      validator: validator,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(15),
          ),
          labelText: title),
    );
  }
}
