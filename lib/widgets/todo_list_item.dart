import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  ListItem({
    required this.title,
    required this.isChecked,
    required this.toogleDone,
    required this.deleteTodo,
  });
  final String title;
  final bool isChecked;
  final Function toogleDone;
  final Function deleteTodo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        deleteTodo();
      },
      leading: CircleAvatar(
        backgroundColor: Colors.blueAccent,
        child: Text(
          title[0],
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.blueAccent,
        value: isChecked,
        onChanged: (newValue) => toogleDone(newValue),
      ),
    );
  }
}
