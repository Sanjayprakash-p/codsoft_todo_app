import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];
  final _myBox = Hive.box('mybox');
  void createInitialData() {
    toDoList = [
      ['Tutorial', false],
      ['App', false],
    ];
  }

  void loadData() {
    toDoList = _myBox.get('TODOLIST');
  }

  void updataDataBase() {
    _myBox.put('TODOLIST', toDoList);
  }
}
