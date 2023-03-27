import 'package:hive/hive.dart';

class DataBase {
  List todoList = [];
  final _mybox = Hive.box('todoflutter');
  void intialiseData() {
    todoList = [
      ["code", false],
      ["shiva", false]
    ];
  }

  void loadData() {
    todoList = _mybox.get("TODOLIST");
  }

  void updateData() {
    _mybox.put("TODOLIST", todoList);
  }
}
