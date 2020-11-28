import 'package:flutter/material.dart';

class Messenger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messenger"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.all(9),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.black12),
                  child: TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        hintText: "Rechercher"),
                  )),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: List.generate(20, (index) => Bubble(index)))),
              Column(
                  children: List.generate(
                      20,
                      (index) => ListTile(
                            contentPadding: EdgeInsets.only(left: 9),
                            leading: CircleAvatar(),
                            title: Text("User $index"),
                            subtitle: Text("Message $index"),
                          )))
            ],
          ),
        ),
      ),
    );
  }
}

class Bubble extends StatelessWidget {
  final int index;
  Bubble(this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(9),
      child: Column(
        children: [CircleAvatar(), Text("User $index")],
      ),
    );
  }
}
