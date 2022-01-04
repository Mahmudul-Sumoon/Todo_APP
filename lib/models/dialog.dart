import 'package:flutter/material.dart';

Dialog leadDialog = Dialog(
  child: Container(
    height: 50.0,
    width: 50.0,
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const <Widget>[
        Text(
          'First Enter a Task',
          style: TextStyle(color: Colors.blueAccent, fontSize: 22.0),
        ),
      ],
    ),
  ),
);
