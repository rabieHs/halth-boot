import 'package:flutter/material.dart';

import '../../../../../core/consts.dart';

class CustomAuthNavigationRow extends StatelessWidget {
  final String label;
  final String actionText;
  void Function()? onTap;
  CustomAuthNavigationRow({
    Key? key,
    required this.label,
    required this.actionText,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label),
        InkWell(
          onTap: onTap,
          child: Text(
            actionText,
            style: TextStyle(
                color: Consts.primaryColor, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
