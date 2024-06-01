import 'package:flutter/material.dart';

import '../../consts.dart';

Future<dynamic> showLoadingDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(),
              SizedBox(
                width: Consts.defaultPadding * 2,
              ),
              Text(
                "Loading...",
                style: Consts.defaultTextStyle,
              )
            ],
          ),
        );
      });
}
