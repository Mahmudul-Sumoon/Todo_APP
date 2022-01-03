import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  const ListItem({
    required this.title,
    required this.isChecked,
    required this.toogleDone,
    Key? key,
  }) : super(key: key);
  final String title;
  final bool isChecked;
  final Function toogleDone;
  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blueAccent,
        child: Text(
          widget.title[0],
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
      ),
      title: Text(
        widget.title,
        style: TextStyle(
          decoration: widget.isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.blueAccent,
        value: widget.isChecked,
        onChanged: (newValue) => widget.toogleDone(newValue),
      ),
    );
  }
}
