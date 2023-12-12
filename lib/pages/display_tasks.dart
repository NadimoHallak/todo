import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/model/group_task_model.dart';

class DisplayTasks extends StatelessWidget {
  DisplayTasks({super.key, required this.todo});
  Todo todo;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, setState) {
        return Column(
          children: [
            Text("title"),
            Text("12 task - 0 completed"),
            Container(
              child: TextFormField(),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return CheckboxListTile(value: false, onChanged: (val) {});
                },
              ),
            )
          ],
        );
      },
    );
  }
}
