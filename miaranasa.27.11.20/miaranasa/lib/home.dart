import 'dart:async';
import 'package:flutter/material.dart';
import 'package:miaranasa/buttons.dart';
import 'package:miaranasa/helpers.dart';
import 'package:miaranasa/login.dart';
import 'package:miaranasa/src/constants/urls.dart';
import 'package:miaranasa/src/models/activity.model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isLoading = false;
  List<ActivityModel> activities = [];

  void deleteUser() {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    _prefs.then((value) {
      value.remove("user");
      Timer(Duration(milliseconds: 400), () {
        goto(context, LoginView(), isReplaced: true);
      });
    });
  }

  void getAllActivities() async {
    setState(() {
      isLoading = true;
    });
    var url = '$URLBASE/activities';

    var response = await http.get(url);
    setState(() {
      isLoading = false;
    });

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      for (var i = 0; i < jsonResponse.length; i++) {
        setState(() {
          activities.add(ActivityModel.fromJSON(jsonResponse[i]));
        });
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  void initState() {
    super.initState();
    getAllActivities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              DrawerHeader(child: null),
              LinkButton(() {
                deleteUser();
              }, title: "Se déconnecter")
            ],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : Column(
                  children: activities
                      .map(
                        (activity) => ActivityCard(
                          postName: activity.postName,
                          entrepriseName: activity.entreprise.name,
                          postNbVue: activity.nbVues,
                          postNote: activity.postNote,
                        ),
                      )
                      .toList(),
                ),
        ),
      ),
    );
  }
}

class ActivityCard extends StatelessWidget {
  final String entrepriseName;
  final String postName;
  final String postNote;
  final String postNbVue;
  ActivityCard(
      {this.entrepriseName, this.postNbVue, this.postName, this.postNote});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        margin: EdgeInsets.only(bottom: 24),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(),
                Row(
                  children: [
                    IconButton(
                        icon: Icon(Icons.favorite_border), onPressed: null),
                    IconButton(icon: Icon(Icons.share), onPressed: null),
                  ],
                )
              ],
            ),
            Text(entrepriseName),
            Text(postName),
            Ratings(int.parse(postNote)),
            Text("($postNbVue)")
          ],
        ),
      ),
    );
  }
}

class Ratings extends StatelessWidget {
  final int count;
  Ratings(this.count);

  List<Widget> _stars() {
    List<Widget> stars = [];
    for (var i = 0; i < count; i++) {
      stars.add(Icon(Icons.star));
    }

    return stars;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: _stars(),
      ),
    );
  }
}
