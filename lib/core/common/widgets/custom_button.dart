import 'package:flutter/material.dart';
import 'package:helthy_translator/core/extensions.dart';

import '../../consts.dart';

class CustomButton extends StatelessWidget {
  void Function()? onPressed;
  final String label;

  CustomButton({
    required this.onPressed,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Consts.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      onPressed: onPressed,
      child: Container(
        width: context.screenWidth * 0.5,
        height: Consts.defaultPadding * 3,
        child: Center(
            child: Text(
          label,
          style: Consts.buttonTextStyle,
        )),
      ),
    );
  }
}
