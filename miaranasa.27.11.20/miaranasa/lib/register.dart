import 'package:flutter/material.dart';
import 'package:miaranasa/accept.dart';
import 'package:miaranasa/buttons.dart';
import 'package:miaranasa/helpers.dart';
import 'package:miaranasa/inputs.dart';
import 'package:miaranasa/login.dart';
import 'package:http/http.dart' as http;

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final double spaceInput = 16;
  Map<String, String> inputs = {};

  void handleInput(String key, String value) {
    inputs[key] = value;
  }

  void register() async {
    print("Async");
    var url = 'http://192.168.1.112:4000/register';
    var response = await http.post(url, body: inputs);
    if (response.statusCode == 200) {
      goto(context, AcceptView(), isReplaced: true);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("images/logo.png"),
              spacing(height: 16),
              Text("Création de compte utilisateur"),
              BorderedInput((text) => {handleInput("nom", text)},
                  placeholder: "Nom"),
              spacing(height: spaceInput),
              BorderedInput((text) => {handleInput("prenom", text)},
                  placeholder: "Prénom"),
              spacing(height: spaceInput),
              BorderedInput((text) => {handleInput("date_naissance", text)},
                  placeholder: "Date de naissance"),
              spacing(height: spaceInput),
              BorderedInput((text) => {handleInput("pseudo", text)},
                  placeholder: "Pseudo"),
              spacing(height: spaceInput),
              BorderedInput((text) => {handleInput("password", text)},
                  placeholder: "Mot de passe"),
              spacing(height: spaceInput),
              BorderedInput((text) => {handleInput("confirm_password", text)},
                  placeholder: "Confirmation de mot de passe"),
              spacing(height: spaceInput),
              BorderedInput((text) => {handleInput("email", text)},
                  placeholder: "Adresse E-mail"),
              spacing(height: spaceInput),
              BorderedInput((text) => {handleInput("phone", text)},
                  placeholder: "Numéro de téléphone"),
              spacing(height: 16),
              PrimaryButton(
                () {
                  register();
                },
                title: "Accepter",
                isWide: true,
              ),
              spacing(height: 16),
              SecondaryButton(() {
                goto(context, LoginView());
              }, title: "Annuler")
            ],
          ),
        ),
      ),
    );
  }
}
