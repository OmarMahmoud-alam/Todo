// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:todoapp/core/failure/server_failure.dart';
import 'package:todoapp/core/utils/dio_helper/app_endpoints.dart';
import 'package:todoapp/core/utils/dio_helper/dio_helper.dart';
import 'package:todoapp/feature/auth/data/models/user.dart';
import 'package:todoapp/feature/home/data/model/todo_item_model/todo_item_model.dart';

class TodoFetchRepo {
  static Future<Either<String, TodoItemModel>> fetchtodos(
      {int pagenumber = 1}) async {
    try {
      final response = await DioHelper.post(
          '${EndPoints.getTodoList}?limit=10&skip=${(pagenumber - 1) * 10}',
          body: {},
          headers: {
            'Accept': 'application/json',
          });

      print("Success LogRepo");
      print(response);

      return Right(TodoItemModel.fromJson(jsonDecode(response.toString())));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e).errMessage);
      }
      return Left(e.toString());
    }
  }
}
