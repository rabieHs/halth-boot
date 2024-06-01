// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../core/consts.dart';

class LanguageSelector extends StatelessWidget {
  final String title;
  void Function(String?)? onChange;
  String? Function(String?) validator;

  LanguageSelector({
    Key? key,
    required this.title,
    required this.onChange,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
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
        items: List.generate(Consts.languages.length, (index) {
          return DropdownMenuItem(
            value: Consts.languages[index],
            child: Text(Consts.languages[index]),
          );
        }),
        onChanged: onChange);
  }
}
