import 'dart:async';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  final String name;
  Login({this.name});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username = "";
  String password = "";
  String message = "";
  bool isLoading = false;

  Widget test() {
    if (isLoading) {
      return CircularProgressIndicator();
    } else {
      return RaisedButton(
        child: Text(widget.name),
        onPressed: () {
          setState(() {
            isLoading = true;
          });
          Timer(Duration(seconds: 4), () {
            if (username == "admin" && password == "admin") {
              setState(() {
                message = "Bienvenue admin";
                isLoading = false;
              });
            } else {
              setState(() {
                message = "Erreur de mot de passe";
                isLoading = false;
              });
            }
          });
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(64),
        child: Column(
          children: [
            Text("Login"),
            TextField(
              onChanged: (text) {
                setState(() {
                  username = text;
                });
              },
            ),
            TextField(
              obscureText: true,
              onChanged: (text) {
                setState(() {
                  password = text;
                });
              },
            ),
            test(),
            Text(message)
          ],
        ),
      ),
    );
  }
}

// REGISTER
class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
