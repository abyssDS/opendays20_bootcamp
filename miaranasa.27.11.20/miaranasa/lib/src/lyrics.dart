import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Lyrics extends StatefulWidget {
  @override
  _LyricsState createState() => _LyricsState();
}

class _LyricsState extends State<Lyrics> {
  String result = "";
  String artist = "";
  String title = "";
  bool isLoading = false;

  void search() async {
    setState(() {
      result = "";
      isLoading = true;
    });

    var url = 'https://api.lyrics.ovh/v1/$artist/$title';
    var response = await http.get(url);
    setState(() {
      isLoading = false;
    });
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse["lyrics"]);
      setState(() {
        result = jsonResponse["lyrics"];
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(hintText: "Artist"),
              onChanged: (text) {
                setState(() {
                  artist = text;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(hintText: "Titre"),
              onChanged: (text) {
                setState(() {
                  title = text;
                });
              },
            ),
            RaisedButton(
              onPressed: () {
                search();
              },
              child: Text("Search"),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Text(result),
            ))
          ],
        ),
      ),
    );
  }
}
