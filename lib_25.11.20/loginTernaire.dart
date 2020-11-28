import 'dart:async';

import 'package:flutter/material.dart';

class LoginTernaire extends StatefulWidget {
  @override
  _LoginTernaireState createState() => _LoginTernaireState();
}

class _LoginTernaireState extends State<LoginTernaire> {
  String username = "";
  String password = "";
  String message = "";
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(64),
        child: Column(
          children: [
            Text("LoginTernaire"),
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
            isLoading
                ? CircularProgressIndicator()
                : RaisedButton(
                    child: Text("LoginTernaire"),
                    onPressed: () {
                      setState(() {
                        isLoading = true;
                      });
                      Timer(Duration(seconds: 4), () {
                        if (username == "admin" && password == "admin") {
                          setState(() {
                            message = "Bienvenue admin";
                          });
                        } else {
                          setState(() {
                            message = "Erreur de mot de passe";
                          });
                        }

                        setState(() {
                          isLoading = false;
                        });
                      });
                    },
                  ),
            Text(message)
          ],
        ),
      ),
    );
  }
}
