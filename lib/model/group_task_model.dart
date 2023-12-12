// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:todo_app/model/task_model.dart';

class Todo {
  String id;
  String title;
  List<Tasks> task;
  Todo({
    required this.id,
    required this.title,
    required this.task,
  });

  Todo copyWith({
    String? id,
    String? title,
    List<Tasks>? task,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      task: task ?? this.task,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'task': task.map((x) => x.toMap()).toList(),
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'] as String,
      title: map['title'] as String,
      task: List<Tasks>.from((map['task'] as List<dynamic>).map<dynamic>((x) => Tasks.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) => Todo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Todo(id: $id, title: $title, task: $task)';

  @override
  bool operator ==(covariant Todo other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      listEquals(other.task, task);
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ task.hashCode;
}
