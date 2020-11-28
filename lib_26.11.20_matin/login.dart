import 'package:flutter/material.dart';
import 'package:miaranasa/buttons.dart';
import 'package:miaranasa/helpers.dart';
import 'package:miaranasa/register.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.black12,
        padding: EdgeInsets.all(24),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spacing(height: MediaQuery.of(context).size.height * .11),
                Image.asset("images/logo.png"),
                spacing(height: 24),
                Text(
                  "Bienvenue sur Miaranasa!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                spacing(height: 24),
                Text(
                  "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Minus saepe iste ea repudiandae ullam doloremque atque eaque at facere odio!",
                  style: TextStyle(color: Colors.grey),
                ),
                spacing(height: 8),
                TextField(
                  decoration: InputDecoration(hintText: "Email Address"),
                ),
                spacing(height: 16),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Password",
                      suffixText: "Oublié?",
                      suffixStyle: TextStyle(color: Colors.blue)),
                ),
                spacing(height: 32),
                Column(
                  children: [
                    PrimaryButton(
                      () {
                        goto(context, RegisterView());
                      },
                      title: "S'identifier",
                    ),
                    spacing(height: 8),
                    LinkButton(title: "S'inscrire")
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
