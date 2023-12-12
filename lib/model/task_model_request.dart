// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:todo_app/model/task_model.dart';

class TodoRequestModel {
  String title;
  List<Tasks>? task;
  TodoRequestModel({
    required this.title,
    this.task,
  });

  TodoRequestModel copyWith({
    String? title,
    List<Tasks>? task,
  }) {
    return TodoRequestModel(
      title: title ?? this.title,
      task: task ?? this.task,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'task': task?.map((x) => x.toMap()).toList(),
    };
  }

  factory TodoRequestModel.fromMap(Map<String, dynamic> map) {
    return TodoRequestModel(
      title: map['title'] as String,
      task: map['task'] != null ? List<Tasks>.from((map['task'] as List<int>).map<Tasks?>((x) => Tasks.fromMap(x as Map<String,dynamic>),),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoRequestModel.fromJson(String source) => TodoRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TodoRequestModel(title: $title, task: $task)';

  @override
  bool operator ==(covariant TodoRequestModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      listEquals(other.task, task);
  }

  @override
  int get hashCode => title.hashCode ^ task.hashCode;
}
