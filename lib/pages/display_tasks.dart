import 'package:flutter/material.dart';

class DisplayTaskes extends StatefulWidget {
  const DisplayTaskes({super.key});

  @override
  State<DisplayTaskes> createState() => _DisplayTaskesState();
}

class _DisplayTaskesState extends State<DisplayTaskes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
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
      ),
    );
  }
}
