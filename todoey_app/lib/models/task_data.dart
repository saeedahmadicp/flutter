import 'package:flutter/foundation.dart';
import 'package:todoey_app/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> list = [
    Task(name: 'Buy Milk'),
    Task(name: 'Do Programming'),
    Task(name: 'Watch Highlights'),
  ];

  int get taskCount {
    return list.length;
  }

  void addTask(String taskTitle) {
    final task = Task(name: taskTitle);
    list.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    list.remove(task);
    notifyListeners();
  }
}
