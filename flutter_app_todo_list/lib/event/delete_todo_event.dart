import 'package:flutter_app_todo_list/base/base_event.dart';
import 'package:flutter_app_todo_list/model/todo.dart';

class DeleteToDoEvent extends BaseEvent {
  Todo todo;

  DeleteToDoEvent(this.todo);
}