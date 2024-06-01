import 'package:flutter/material.dart';
import 'package:helthy_translator/core/extensions.dart';

import '../../../../../core/consts.dart';

class ChatBubble extends StatelessWidget {
  final bool isSender;
  final String message;
  final String? time;
  const ChatBubble({
    Key? key,
    required this.isSender,
    required this.message,
    this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Consts.defaultPadding / 4),
      child: Align(
        alignment: isSender
            ? Alignment.centerRight
            : Alignment
                .centerLeft, // Align left for received messages, right for sent messages
        child: Container(
          constraints: BoxConstraints(
            maxWidth: context.screenWidth * 0.75,
          ),
          padding: EdgeInsets.symmetric(
              horizontal: Consts.defaultPadding,
              vertical: Consts.defaultPadding),
          decoration: isSender
              ? BoxDecoration(
                  color: Consts.primaryColor,
                  borderRadius: BorderRadius.circular(15)
                      .copyWith(bottomRight: Radius.circular(0)),
                )
              : BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey.withOpacity(0.3))),
          child: Text(
            message,
            style: TextStyle(color: isSender ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
