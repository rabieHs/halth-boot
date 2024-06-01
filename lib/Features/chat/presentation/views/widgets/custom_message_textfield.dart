// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomMessageTextField extends StatelessWidget {
  bool isRecord;
  String? Function(String?) validator;
  final TextEditingController nameController;
  final String title;
  bool? isPassword;
  final void Function()? onAudioTaped;

  CustomMessageTextField({
    Key? key,
    required this.isRecord,
    required this.validator,
    required this.nameController,
    required this.title,
    this.isPassword = false,
    required this.onAudioTaped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword!,
      controller: nameController,
      validator: validator,
      decoration: InputDecoration(
          suffixIcon: GestureDetector(
              onTap: onAudioTaped,
              child: Icon(
                Icons.mic_rounded,
                color: isRecord ? Colors.red : Colors.grey,
              )),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(25),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(25),
          ),
          hintText: title,
          hintStyle: TextStyle(fontWeight: FontWeight.w400)),
    );
  }
}
