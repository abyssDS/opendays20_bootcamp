import 'package:flutter/material.dart';
import 'package:miaranasa/buttons.dart';
import 'package:miaranasa/helpers.dart';
import 'package:miaranasa/home.dart';

class AcceptView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Votre compte a été créé"),
            Text(
                "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Minus saepe iste ea repudiandae ullam doloremque atque eaque at facere odio!"),
            PrimaryButton(
              () {
                goto(context, HomeView(), isReplaced: true);
              },
              isWide: true,
              title: "OK",
            )
          ],
        ),
      ),
    );
  }
}
