import 'package:flutter/material.dart';

import '../../../../../core/consts.dart';

class CustomUserContainer extends StatelessWidget {
  final String name;
  final String image;
  final String message;
  final String time;
  final void Function()? onTap;
  const CustomUserContainer({
    Key? key,
    required this.name,
    required this.image,
    required this.message,
    required this.time,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: Consts.defaultPadding / 5,
          horizontal: Consts.defaultPadding),
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.grey.withOpacity(0.4))),
        tileColor: Colors.white.withOpacity(0.5),
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(image: NetworkImage(image))),
        ),
        title: Text(
          message,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(name),
        trailing: Text(time),
      ),
    );
  }
}
