import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jademagazine/todoItem.dart';

SizedBox ecart({double width = 0, double height = 0}) {
  return SizedBox(width: width, height: height);
}

class TodoListApp extends StatefulWidget {
  @override
  _TodoListAppState createState() => _TodoListAppState();
}

class _TodoListAppState extends State<TodoListApp> {
  List<String> todos = [];
  bool isLoading = true;

  String todo = "";

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
        todos = ["Carotte", "Kiwi"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: TextField(
                  onChanged: (text) {
                    setState(() {
                      todo = text;
                    });
                  },
                )),
                ecart(width: 16),
                RaisedButton(
                    color: Colors.teal,
                    onPressed: () {
                      setState(() {
                        todos.add(todo);
                      });
                    },
                    child: Text("Ajouter"))
              ],
            ),
            ecart(height: 16),
            isLoading
                ? CircularProgressIndicator()
                : Column(
                    children:
                        todos.map((element) => TodoItem(element)).toList())
          ],
        ),
      ),
    );
  }
}
