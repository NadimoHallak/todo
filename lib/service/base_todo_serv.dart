import 'package:dio/dio.dart';
import 'package:todo_app/model/group_task_model.dart';
import 'package:todo_app/model/task_model_request.dart';

abstract class Services {
  Dio dio = Dio();
  String baseUrl = "https://65779cb7197926adf62e9b0e.mockapi.io/todo";

  updateTodo(int id);
  deleteTodo(int id);
  creteTodo(TodoRequestModel todo);
  Future<List<Todo>> getTodo();
  Todo getOneTodo(int id);
}
