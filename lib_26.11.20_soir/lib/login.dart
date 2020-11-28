import 'dart:async';
import 'package:flutter/material.dart';
import 'package:miaranasa/buttons.dart';
import 'package:miaranasa/helpers.dart';
import 'package:miaranasa/home.dart';
import 'dart:convert' as convert;
import 'package:miaranasa/register.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  Map<String, String> inputs = {};
  String message = "";
  bool isLoading = false;

  void saveUser() {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    _prefs.then((value) {
      value.setString("user", convert.json.encode(inputs));
    });
  }

  void handleInput(String key, String value) {
    inputs[key] = value;
  }

  void login() async {
    setState(() {
      message = "";
      isLoading = true;
    });
    var url = 'http://192.168.1.112:4000/login';
    var response = await http.post(url, body: inputs);
    setState(() {
      isLoading = false;
    });
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      if (jsonResponse["message"] != "Bienvenue!") {
        setState(() {
          message = jsonResponse["message"];
        });
      } else {
        saveUser();
        Timer(Duration(milliseconds: 400), () {
          goto(context, HomeView(), isReplaced: true);
        });
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.black12,
        padding: EdgeInsets.all(24),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spacing(height: MediaQuery.of(context).size.height * .11),
                Image.asset("images/logo.png"),
                spacing(height: 24),
                Text(
                  "Bienvenue sur Miaranasa!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                spacing(height: 24),
                Text(
                  "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Minus saepe iste ea repudiandae ullam doloremque atque eaque at facere odio!",
                  style: TextStyle(color: Colors.grey),
                ),
                spacing(height: 8),
                TextField(
                  decoration: InputDecoration(hintText: "Email Address"),
                  onChanged: (text) => {handleInput("email", text)},
                ),
                spacing(height: 16),
                TextField(
                  onChanged: (text) => {handleInput("password", text)},
                  decoration: InputDecoration(
                      hintText: "Password",
                      suffixText: "Oublié?",
                      suffixStyle: TextStyle(color: Colors.blue)),
                ),
                spacing(height: 16),
                Center(child: Text(message)),
                spacing(height: 32),
                isLoading
                    ? CircularProgressIndicator()
                    : Column(
                        children: [
                          PrimaryButton(
                            () {
                              login();
                            },
                            title: "S'identifier",
                          ),
                          spacing(height: 8),
                          LinkButton(() {
                            goto(context, RegisterView());
                          }, title: "S'inscrire")
                        ],
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
