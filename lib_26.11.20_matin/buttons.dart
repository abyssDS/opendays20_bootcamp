import 'package:flutter/material.dart';
import 'package:miaranasa/helpers.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final bool isWide;
  final Function action;
  PrimaryButton(this.action, {this.title, this.isWide = false});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: isWide ? double.infinity : null,
        height: 56,
        child: RaisedButton(
            elevation: 0,
            color: Colors.redAccent,
            onPressed: action,
            child: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
            )));
  }
}

class SecondaryButton extends StatelessWidget with ButtonRoot {
  final String title;
  final Function action;
  SecondaryButton(this.action, {this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 56,
        child: RaisedButton(
            elevation: 0,
            color: Colors.orangeAccent,
            onPressed: action,
            child: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
            )));
  }
}

class ButtonRoot {
  Widget screen;
  BuildContext context;
  void onClick() {
    goto(context, screen);
  }
}

class LinkButton extends StatelessWidget {
  final String title;
  LinkButton({this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: FlatButton(
            onPressed: () {},
            child: Text(title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ))));
  }
}
