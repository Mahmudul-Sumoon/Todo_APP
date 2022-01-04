import 'package:flutter/material.dart';
//import 'package:todo_provider/models/dialog.dart';
import '../utilities/utilities.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/models/task_data.dart';
//import 'package:dismissible_page/dismissible_page.dart';

class BottomSheetScreen extends StatelessWidget {
  const BottomSheetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? newTitle;
    return Container(
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
                  'Enter a Task'.showAsDialog(context,
                      duration: const Duration(seconds: 1));
                } else {
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(newTitle!);
                  Navigator.pop(context);
                }
              },
              child: const Text("ADD"),
            )
          ],
        ),
      ),
    );
  }
}
