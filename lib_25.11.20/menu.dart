import 'package:flutter/material.dart';
import 'package:jademagazine/login.dart';
import 'package:jademagazine/messenger.dart';
import 'package:jademagazine/todolist.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  String name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mes applications"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/calendar.png",
              height: 150,
            ),
            TextField(
              onChanged: (text) {
                setState(() {
                  name = text;
                });
              },
            ),
            Button("Login", Login(name: name)),
            Button("Messenger", Messenger()),
            Button("Todo List", TodoListApp()),
          ],
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String title;
  final Widget screen;
  Button(this.title, this.screen);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => screen));
        },
        child: Text(title),
      ),
    );
  }
}
