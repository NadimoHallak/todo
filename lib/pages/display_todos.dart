import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/constant/model_list_tasks.dart';
import 'package:todo_app/model/group_task_model.dart';
import 'package:todo_app/model/task_model.dart';
import 'package:todo_app/model/task_model_request.dart';
import 'package:todo_app/pages/display_tasks.dart';
import 'package:todo_app/service/todo_serv.dart';

class DisplayAllTasks extends StatefulWidget {
  DisplayAllTasks({super.key});

  @override
  State<DisplayAllTasks> createState() => _DisplayAllTasksState();
}

class _DisplayAllTasksState extends State<DisplayAllTasks> {
  TextEditingController controller = TextEditingController();

  List<Todo> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lists',
          style: TextStyle(
            color: Colors.black,
            fontSize: 34,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
      ),
      body: FutureBuilder(
        future: TodoServ().getTodo(),
        builder: (context, snapshot) {
          // print(snapshot.data);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            dynamic temp = snapshot.data;
            todos = temp as List<Todo>;
            // print("temp *********\n" + snapshot.data.toString());

            return Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: TextFormField(
                    controller: controller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                      itemCount: todos.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 120,
                        crossAxisSpacing: 20,
                        childAspectRatio: 4 / 2,
                        mainAxisSpacing: 20,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            // () => context.go("/tasks");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DisplayTasks(todo: todos[index],),
                              ),
                            );
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(15)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black45,
                                      spreadRadius: 0,
                                      blurRadius: 7)
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  todos[index].title,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                                const Text(
                                  '10 task - 5 completed',
                                  style: TextStyle(
                                    color: Color(0xFF999999),
                                    fontSize: 10.50,
                                    fontFamily: 'Comfortaa',
                                    fontWeight: FontWeight.w300,
                                    height: 0,
                                  ),
                                ),
                                Container(
                                  child: const LinearProgressIndicator(
                                    value: 1.0,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            );
          } else {
            return const Center(
              child: Text("Error"),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          String title = '';
          if (controller.text.trim().isNotEmpty) {
            setState(() {
              title = controller.text;
              TodoRequestModel todo = TodoRequestModel(title: title);
              TodoServ().creteTodo(todo);
            });
          }
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
