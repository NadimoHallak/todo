import 'package:dio/dio.dart';
import 'package:todo_app/model/group_task_model.dart';
import 'package:todo_app/model/task_model_request.dart';
import 'package:todo_app/service/base_todo_serv.dart';

class TodoServ extends Services {
  @override
  creteTodo(TodoRequestModel todo) async {
    Response response = await dio.post(baseUrl, data: todo.toJson());
    print(response.data);
  }

  @override
  deleteTodo(int id) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  Todo getOneTodo(int id) {
    // TODO: implement getOneTodo
    throw UnimplementedError();
  }

  @override
  Future<List<Todo>> getTodo() async {
    Response response = await dio.get(baseUrl);
    dynamic temp = response.data;
    print(temp.toString());
    List<Todo> todos =
        List.generate(temp.length, (index) => Todo.fromMap(temp[index]));
    if (response.statusCode == 200) {
      print("object");
      return todos;
    } else {
      return [];
    }
  }

  @override
  updateTodo(int id) {
    // TODO: implement updateTodo
    throw UnimplementedError();
  }
}
