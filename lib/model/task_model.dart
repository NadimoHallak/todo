// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Tasks {
  String todoId;
  String taskTitle;
  bool isCompleat;
  Tasks({
    required this.todoId,
    required this.taskTitle,
    required this.isCompleat,
  });

  Tasks copyWith({
    String? todoId,
    String? taskTitle,
    bool? isCompleat,
  }) {
    return Tasks(
      todoId: todoId ?? this.todoId,
      taskTitle: taskTitle ?? this.taskTitle,
      isCompleat: isCompleat ?? this.isCompleat,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'todoId': todoId,
      'taskTitle': taskTitle,
      'isCompleat': isCompleat,
    };
  }

  factory Tasks.fromMap(Map<String, dynamic> map) {
    return Tasks(
      todoId: map['todoId'] as String,
      taskTitle: map['taskTitle'] as String,
      isCompleat: map['isCompleat'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Tasks.fromJson(String source) =>
      Tasks.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Tasks(todoId: $todoId, taskTitle: $taskTitle, isCompleat: $isCompleat)';

  @override
  bool operator ==(covariant Tasks other) {
    if (identical(this, other)) return true;

    return other.todoId == todoId &&
        other.taskTitle == taskTitle &&
        other.isCompleat == isCompleat;
  }

  @override
  int get hashCode =>
      todoId.hashCode ^ taskTitle.hashCode ^ isCompleat.hashCode;
}
