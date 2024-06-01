import 'package:flutter/material.dart';

class UserTypePicker extends StatelessWidget {
  void Function(String?)? onChanged;
  UserTypePicker({
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
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
            labelText: "Type"),
        items: [
          DropdownMenuItem(
            child: Text("Patient"),
            value: "patient",
          ),
          DropdownMenuItem(
            child: Text("Doctor"),
            value: "doctor",
          ),
        ],
        onChanged: onChanged);
  }
}
