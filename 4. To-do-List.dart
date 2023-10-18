/*
pubspec.yaml
-------------------------
dependencies:
  flutter:
    sdk: flutter
  shared_preferences: ^2.0.5
*/

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(ToDoListApp());

class ToDoListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: ToDoList(),
    );
  }
}

class ToDoList extends StatefulWidget {
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List<String> tasks = [];
  final taskController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      tasks = prefs.getStringList('tasks') ?? [];
    });
  }

  _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('tasks', tasks);
  }

  _addTask(String task) {
    setState(() {
      tasks.add(task);
      taskController.clear();
      _saveTasks();
    });
  }

  _removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
      _saveTasks();
    });
  }

  _toggleTask(int index) {
    setState(() {
      tasks[index] = ' ' + tasks[index];
      _saveTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
        backgroundColor: Colors.red[800],
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(tasks[index]),
            onDismissed: (direction) {
              _removeTask(index);
            },
            child: ListTile(
              title: Text(
                tasks[index],
                style: TextStyle(
                  color: tasks[index].startsWith(' ') ? Colors.red[800] : Colors.black,
                  fontWeight: tasks[index].startsWith(' ') ? FontWeight.bold : FontWeight.normal,
                  decoration: tasks[index].startsWith(' ') ? TextDecoration.lineThrough  : TextDecoration.none,
                ),
              ),
              leading: IconButton(
                icon: Icon(
                    color: tasks[index].startsWith(' ') ? Colors.red[800] : Colors.black,
                    Icons.add_task_sharp
                ),
                onPressed: () {
                  _toggleTask(index);
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(

        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Add Task'),
                content: TextField(
                  controller: taskController,
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('Add'),
                    onPressed: () {
                      _addTask(taskController.text);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red[800],
      ),
    );
  }
}
