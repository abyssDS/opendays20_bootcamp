import 'package:flutter/material.dart';

class BorderedInput extends StatelessWidget {
  final String placeholder;
  final Function onChange;
  BorderedInput(this.onChange, {this.placeholder});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
          onChanged: onChange,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              hintText: placeholder)),
    );
  }
}
