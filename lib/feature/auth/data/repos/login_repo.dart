// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:todoapp/core/failure/server-failure.dart';
import 'package:todoapp/core/utils/dio_helper/app_endpoints.dart';
import 'package:todoapp/core/utils/dio_helper/dio_helper.dart';

import '../models/user_model.dart';

class LoginRepo {
  Future<Either<String, UserModel>> login(String email, String password) async {
    try {
      final response = await DioHelper.post(EndPoints.login, body: {
        'email': email,
        'password': password,
      }, headers: {
        'Accept': 'application/json',
      });

      if (response.statusCode == 200 && response.data['status'] == 'success') {
        print("Success LoginRepo");
        print(response);
        return Right(UserModel.fromJson(jsonDecode(response.toString())));
      } else {
        print(response);
        return Left('حدث خطا فى تسجيل الدخول');
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e).errMessage);
      }
      return Left(e.toString());
    }
  }
}
