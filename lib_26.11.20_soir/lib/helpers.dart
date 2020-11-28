import 'package:flutter/material.dart';

SizedBox spacing({double height = 0, double width = 0}) {
  return SizedBox(
    width: width,
    height: height,
  );
}

void goto(BuildContext context, Widget screen, {bool isReplaced = false}) {
  isReplaced
      ? Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => screen))
      : Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => screen));
}
