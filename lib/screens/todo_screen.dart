import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todo_provider/models/task.dart';
import 'package:todo_provider/screens/bottom_sheet_screen.dart';
import 'package:todo_provider/widgets/todo_list_item.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<Task> tasks = [
    Task(isDone: false, taskName: "SLEEP"),
    Task(isDone: false, taskName: "EAT"),
    Task(isDone: false, taskName: "WALK")
  ];
  void addTask(String newTitle) {
    setState(() {
      tasks.add(Task(isDone: false, taskName: newTitle));
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            //backgroundColor: Color(0xFF757575),
            backgroundColor: Colors.transparent,
            context: context,
            builder: (BuildContext context) => BottomSheetScreen(
              addNewTitle: addTask,
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.blueAccent,
      body: Padding(
        padding: const EdgeInsets.only(
          //   bottom: 30,
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: CircleAvatar(
                child: Icon(Icons.list),
                backgroundColor: Colors.white,
                radius: 30.0,
              ),
            ),
            const SizedBox(height: 10.0),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Text(
                "Todos",
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Text(
                '${tasks.length} Tasks',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                  top: 20.0,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return ListItem(
                        title: tasks[index].taskName,
                        isChecked: tasks[index].isDone,
                        toogleDone: (bool newValue) {
                          setState(() {
                            tasks[index].toggleDone();
                          });
                        },
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
