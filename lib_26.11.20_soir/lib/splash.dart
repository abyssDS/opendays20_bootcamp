import 'dart:async';

import 'package:flutter/material.dart';
import 'package:miaranasa/helpers.dart';
import 'package:miaranasa/home.dart';
import 'package:miaranasa/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Future<SharedPreferences> _prefs;

  @override
  void initState() {
    super.initState();
    _prefs = SharedPreferences.getInstance();
    _prefs.then((value) {
      Timer(Duration(seconds: 2), () {
        var user = value.getString("user");
        if (user == null) {
          goto(context, LoginView(), isReplaced: true);
        } else {
          goto(context, HomeView(), isReplaced: true);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/logo.png"),
            spacing(height: 16),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
