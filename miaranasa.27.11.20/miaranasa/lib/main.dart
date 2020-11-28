import 'package:flutter/material.dart';
import 'package:miaranasa/login.dart';
import 'package:miaranasa/splash.dart';
import 'package:miaranasa/src/lyrics.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashView(),
    );
  }
}
