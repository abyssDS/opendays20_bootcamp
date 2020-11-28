import 'package:flutter/material.dart';

class Listing extends StatefulWidget {
  @override
  _ListingState createState() => _ListingState();
}

class _ListingState extends State<Listing> {
  int counter = 0;
  String name = "";

  Widget test() {
    if (name == "Tino") {
      return Text("Io Tino io e!");
    }

    return Text("");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          padding: EdgeInsets.all(64),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("You clicked this button $counter times"),
              TextField(
                onChanged: (text) {
                  setState(() {
                    name = text;
                  });
                },
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    counter++;
                  });
                },
                child: Text("Click me"),
              ),
              test()
            ],
          )),
    );
  }
}
