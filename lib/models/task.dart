class Task {
  final String taskName;
  bool isDone;
  Task({required this.isDone, required this.taskName});
  void toggleDone() {
    isDone = !isDone;
  }
}
