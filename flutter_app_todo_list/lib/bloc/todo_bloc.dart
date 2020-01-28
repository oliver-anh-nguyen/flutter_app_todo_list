import 'dart:async';
import 'dart:math';
import 'package:flutter_app_todo_list/base/base_bloc.dart';
import 'package:flutter_app_todo_list/base/base_event.dart';
import 'package:flutter_app_todo_list/event/add_todo_event.dart';
import 'package:flutter_app_todo_list/event/delete_todo_event.dart';
import 'package:flutter_app_todo_list/model/todo.dart';
import 'package:flutter_app_todo_list/repo/todo_repo.dart';

class TodoBloc extends BaseBloc {

  TodoRepo _todoRepo = TodoRepo();

  StreamController<List<Todo>> _todoListStreamController =
      StreamController<List<Todo>>();
  Stream<List<Todo>> get todoListStream => _todoListStreamController.stream;

  var _randomInt = Random();
  List<Todo> _todoListData = List<Todo>();

  initData() async {
    var data = await _todoRepo.selectAllTodo();
    _todoListStreamController.sink.add(data);
  }

  _addTodo(Todo todo) async {
    // insert to database
    await _todoRepo.insertTodo(todo);

    _todoListData.add(todo);
    _todoListStreamController.sink.add(_todoListData);
  }

  _deleteTodo(Todo todo) async {

    await _todoRepo.deleteTodo(todo);

    _todoListData.remove(todo);
    _todoListStreamController.sink.add(_todoListData);
  }

  @override
  void dispatchEvent(BaseEvent event) {
    if (event is AddToDoEvent) {
      Todo todo = Todo.fromData(_randomInt.nextInt(1000000), event.content);
      _addTodo(todo);
    } else if (event is DeleteToDoEvent) {
      _deleteTodo(event.todo);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _todoListStreamController.close();
  }
}