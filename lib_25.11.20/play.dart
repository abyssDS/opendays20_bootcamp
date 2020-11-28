import 'package:flutter/material.dart';

class Play extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: List.generate(
                        20,
                        (index) => Text(
                              "23",
                              style: TextStyle(fontSize: 23),
                            ))),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                      children: List.generate(
                          20,
                          (index) => Text(
                                "23",
                                style: TextStyle(fontSize: 23),
                              ))),
                ),
              )
            ],
          ),
        ));
  }
}

class ContainerImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Text("23"),
    );
  }
}
