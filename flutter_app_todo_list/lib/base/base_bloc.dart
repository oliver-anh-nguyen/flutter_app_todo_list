import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_todo_list/base/base_event.dart';

abstract class BaseBloc {
  StreamController<BaseEvent> _eventStreamController = StreamController<BaseEvent>();

  Sink<BaseEvent> get event => _eventStreamController.sink;

  BaseBloc() {
    _eventStreamController.stream.listen((event) {
      if (event is! BaseEvent) {
        throw Exception("Event not found!!!");
      }

      dispatchEvent(event);
    });
  }

  void dispatchEvent(BaseEvent event);


  @mustCallSuper
  void dispose() {
    _eventStreamController.close();
  }

}