import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/data/database.dart';
import 'package:to_do_app/util/diologBox.dart';
import 'package:to_do_app/util/toDoTile.dart';

class MyHomePAge extends StatefulWidget {
  const MyHomePAge({super.key});

  @override
  State<MyHomePAge> createState() => _MyHomePAgeState();
}

class _MyHomePAgeState extends State<MyHomePAge> {
  DataBase db = DataBase();
  final _mybox = Hive.box('todoflutter');
  @override
  void initState() {
    if (_mybox.get("TODOLIST") == null) {
      db.intialiseData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  void checkbox(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
  }

  void onsave() {
    List t = [controller.text, false];
    setState(() {
      db.todoList.add(t);
      controller.clear();
    });
    db.updateData();
    Navigator.pop(context);
  }

  TextEditingController controller = TextEditingController();
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return MyDiolog(
            controller: controller,
            oncancel: () => Navigator.pop(context),
            onsave: onsave,
          );
        });
  }

  void deletetask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: createNewTask, child: Icon(Icons.add)),
      backgroundColor: Colors.purple.shade200,
      appBar: AppBar(
        title: Text("TO DO"),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return ToDoTile(
            toDoText: db.todoList[index][0],
            isCompleted: db.todoList[index][1],
            onChanged: (value) => checkbox(value, index),
            deletetask: (context) => deletetask(index),
          );
        },
      ),
    );
  }
}
