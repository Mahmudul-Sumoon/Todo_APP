import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todo_provider/models/task_data.dart';
import 'package:todo_provider/screens/bottom_sheet_screen.dart';
import 'package:todo_provider/widgets/todo_list_item.dart';
import 'package:provider/provider.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Padding(
        padding: const EdgeInsets.only(
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
                '${Provider.of<TaskData>(context).taskCount} Tasks',
                style: const TextStyle(
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
                child: Consumer<TaskData>(
                  builder: (context, taskData, child) {
                    return ListView.builder(
                        itemCount: taskData.taskCount,
                        itemBuilder: (context, index) {
                          final task = taskData.tasks[index];
                          return ListItem(
                            title: task.taskName,
                            isChecked: task.isDone,
                            toogleDone: (bool newValue) {
                              taskData.updateCheckbox(task);
                            },
                            deleteTodo: () {
                              taskData.deleteTask(task);
                            },
                          );
                        });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            //backgroundColor: Color(0xFF757575),
            backgroundColor: Colors.transparent,
            context: context,
            builder: (BuildContext context) => const BottomSheetScreen(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
