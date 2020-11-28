import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double a;
  double b;
  double result = 0;

  void addition() {
    setState(() {
      result = a + b;
    });
  }

  void substract() {
    setState(() {
      result = a - b;
    });
  }

  void multiplication() {
    setState(() {
      result = a * b;
    });
  }

  void division() {
    setState(() {
      result = a / b;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculatrice")),
      body: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (text) {
                  setState(() {
                    a = double.parse(text);
                  });
                },
              ),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (text) {
                  setState(() {
                    b = double.parse(text);
                  });
                },
              ),
              Row(
                children: [
                  IconButton(icon: Icon(Icons.add), onPressed: addition),
                  IconButton(icon: Icon(Icons.minimize), onPressed: substract),
                  IconButton(
                      icon: Icon(Icons.timelapse_sharp),
                      onPressed: multiplication),
                  IconButton(
                      icon: Icon(Icons.domain_verification),
                      onPressed: division),
                ],
              ),
              Text("Resultat: $result", style: TextStyle(fontSize: 42)),
            ],
          )),
    );
  }
}
