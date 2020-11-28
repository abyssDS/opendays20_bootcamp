import 'package:flutter/material.dart';
import 'package:jademagazine/menu.dart';
import 'package:jademagazine/todolist.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Menu(),
    );
  }
}
