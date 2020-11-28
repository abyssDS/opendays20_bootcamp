import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final String todo;
  TodoItem(this.todo);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
          trailing: IconButton(icon: Icon(Icons.delete), onPressed: null),
          leading: CircleAvatar(),
          title: Text(todo)),
    );
  }
}
