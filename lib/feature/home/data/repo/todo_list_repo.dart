// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:dio/dio.dart';
import 'package:todoapp/core/failure/server_failure.dart';
import 'package:todoapp/core/utils/dio_helper/app_endpoints.dart';
import 'package:todoapp/core/utils/dio_helper/dio_helper.dart';
import 'package:todoapp/core/utils/storage/sql_helper.dart';
import 'package:todoapp/feature/home/data/model/todo_item_model/todo.dart';
import 'package:todoapp/feature/home/data/model/todo_item_model/todo_item_model.dart';

class TodoFetchRepo {
  static DatabaseHelper db = DatabaseHelper();
  static Future<Either<String, TodoItemModel>> fetchtodos(
      {int pagenumber = 1}) async {
    List<Todo> res = await db.getTodos((pagenumber - 1), 10);

    if (res.isEmpty) {
      return await fetchProductOnline(pagenumber);
    } else {
      return right(TodoItemModel(todos: res));
    }
  }

  static Future<Either<String, TodoItemModel>> fetchProductOnline(
      int pagenumber) async {
    try {
      final response = await DioHelper.post(
          '${EndPoints.getTodoList}?limit=10&skip=${(pagenumber - 1) * 10}',
          body: {},
          headers: {
            'Accept': 'application/json',
          });

      print("Success LogRepo");
      print(response);
      final TodoItemModel todo =
          TodoItemModel.fromJson(jsonDecode(response.toString()));
      for (var item in todo.todos!) {
        await db.insertTodo(item);
      }

      return  Right(todo);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e).errMessage);
      }
      return Left(e.toString());
    }
  }
}
