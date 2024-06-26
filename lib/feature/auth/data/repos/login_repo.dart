// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:todoapp/core/failure/server_failure.dart';
import 'package:todoapp/core/utils/dio_helper/app_endpoints.dart';
import 'package:todoapp/core/utils/dio_helper/dio_helper.dart';
import 'package:todoapp/feature/auth/data/models/user.dart';

class LoginRepo {
  Future<Either<String, UserModel>> login(String email, String password) async {
    try {
      final response = await DioHelper.post(EndPoints.login, body: {
        'username': email,
        'password': password,
        'expiresInMins': 1,
      }, headers: {
        'Accept': 'application/json',
      });

      print("Success LoginRepo");
      print(response);

      return Right(UserModel.fromjson(jsonDecode(response.toString())));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e).errMessage);
      }
      return Left(e.toString());
    }
  }
}
