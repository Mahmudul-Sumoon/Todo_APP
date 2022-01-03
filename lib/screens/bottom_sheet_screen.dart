import 'package:flutter/material.dart';
//import 'package:todo_provider/models/dialog.dart';

class BottomSheetScreen extends StatelessWidget {
  BottomSheetScreen({Key? key, required this.addNewTitle}) : super(key: key);
  final Function addNewTitle;
  String? newTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 30.0,
            right: 30.0,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  "ADD TASK",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              TextField(
                textAlign: TextAlign.center,
                autofocus: true,
                onChanged: (value) {
                  newTitle = value;
                },
              ),
              const SizedBox(
                height: 5.0,
              ),
              ElevatedButton(
                onPressed: () {
                  if (newTitle == null) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          Future.delayed(const Duration(seconds: 1), () {
                            Navigator.of(context).pop(true);
                          });
                          return const AlertDialog(
                            title: Text('First Enter a Task'),
                          );
                        });
                  } else {
                    addNewTitle(newTitle);
                  }
                },
                child: const Text("ADD"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
