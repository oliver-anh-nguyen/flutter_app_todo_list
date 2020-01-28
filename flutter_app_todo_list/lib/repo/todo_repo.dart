import 'package:flutter_app_todo_list/db/todo_table.dart';
import 'package:flutter_app_todo_list/model/todo.dart';
import 'package:flutter_app_todo_list/service/todo_service.dart';

class TodoRepo {
  TodoTable _todoTable = TodoTable();
  TodoService todoService = TodoService();

  Future<int> insertTodo(Todo todo) {
    return _todoTable.insertTodo(todo);
  }

  Future<void>deleteTodo(Todo todo) async {
    return _todoTable.deleteTodo(todo);
  }

  Future<List<Todo>> selectAllTodo() async {
    return _todoTable.selectAllTodo();
  }

  Future<List<Todo>> initData() async {
    List<Todo> data = List<Todo>();
    data = await _todoTable.selectAllTodo();
    if (data.length == 0) {
      return await todoService.getTodoList();
    }
    return data;
  }
}