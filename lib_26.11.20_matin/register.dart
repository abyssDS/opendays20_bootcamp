import 'package:flutter/material.dart';
import 'package:miaranasa/buttons.dart';
import 'package:miaranasa/helpers.dart';
import 'package:miaranasa/inputs.dart';

class RegisterView extends StatelessWidget {
  final double spaceInput = 16;
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
              BorderedInput(placeholder: "Nom"),
              spacing(height: spaceInput),
              BorderedInput(placeholder: "Prénom"),
              spacing(height: spaceInput),
              BorderedInput(placeholder: "Date de naissance"),
              spacing(height: spaceInput),
              BorderedInput(placeholder: "Pseudo"),
              spacing(height: spaceInput),
              BorderedInput(placeholder: "Mot de passe"),
              spacing(height: spaceInput),
              BorderedInput(placeholder: "Confirmation de mot de passe"),
              spacing(height: spaceInput),
              BorderedInput(placeholder: "Adresse E-mail"),
              spacing(height: spaceInput),
              BorderedInput(placeholder: "Numéro de téléphone"),
              spacing(height: 16),
              PrimaryButton(
                () {},
                title: "Accepter",
                isWide: true,
              ),
              spacing(height: 16),
              SecondaryButton(() {}, title: "Annuler")
            ],
          ),
        ),
      ),
    );
  }
}
