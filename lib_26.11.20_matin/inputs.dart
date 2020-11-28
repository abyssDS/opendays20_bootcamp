import 'package:flutter/material.dart';

class BorderedInput extends StatelessWidget {
  final String placeholder;
  BorderedInput({this.placeholder});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              hintText: placeholder)),
    );
  }
}
