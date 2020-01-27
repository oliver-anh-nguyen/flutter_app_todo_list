import 'package:flutter/material.dart';
import 'package:flutter_app_todo_list/bloc/todo_bloc.dart';
import 'package:flutter_app_todo_list/todo/todo_list_container.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text("Todo List"),
          ),
          body: Provider<TodoBloc>.value(value: TodoBloc(), child: TodoListContainer())),
    );
  }
}
