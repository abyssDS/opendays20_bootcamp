import 'dart:async';

import 'package:flutter/material.dart';
import 'package:miaranasa/buttons.dart';
import 'package:miaranasa/helpers.dart';
import 'package:miaranasa/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  void deleteUser() {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    _prefs.then((value) {
      value.remove("user");
      Timer(Duration(milliseconds: 400), () {
        goto(context, LoginView(), isReplaced: true);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(child: null),
            LinkButton(() {
              deleteUser();
            }, title: "Se déconnecter")
          ],
        ),
      ),
    );
  }
}
