import 'package:flutter_app_todo_list/db/todo_table.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ToDoDatabase {
  static const DB_NAME = 'todo.db';
  static const DB_VERSION = 1;
  static Database _database;

  ToDoDatabase._internal();

  static final ToDoDatabase instance = ToDoDatabase._internal();

  Database get database => _database;

  static const initScripts = [TodoTable.CREATE_TABLE_QUERY];
  static const migrationScripts = [TodoTable.CREATE_TABLE_QUERY];

  init() async {
    _database = await openDatabase(join(await getDatabasesPath(), DB_NAME), onCreate: (db, version) {
      initScripts.forEach((script) async => await db.execute(script));
    }, onUpgrade: (db, oldVersion, newVersion) {
      migrationScripts.forEach((script) async => await db.execute(script));
    }, version: DB_VERSION,);
  }
}
