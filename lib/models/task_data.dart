import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todo_provider/models/task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(isDone: false, taskName: "SLEEP"),
    Task(isDone: false, taskName: "EAT"),
    Task(isDone: false, taskName: "WALK")
  ];
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

//value pass purpose
  int get taskCount {
    return _tasks.length;
  }

  ///update purpose
  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void addTask(String newTaskTitle) {
    final task = Task(taskName: newTaskTitle, isDone: false);
    _tasks.add(task);
    notifyListeners();
  }

  void updateCheckbox(Task task) {
    task.toggleDone();
    notifyListeners();
  }
}
