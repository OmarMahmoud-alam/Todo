// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:todoapp/core/failure/server-failure.dart';
import 'package:todoapp/core/utils/dio_helper/app_endpoints.dart';
import 'package:todoapp/core/utils/dio_helper/dio_helper.dart';

import '../models/user_model.dart';

class RegisterRepo {
  Future<Either<String, UserModel>> register(
      {required String name,
      required String email,
      required String phone,
      required String? schoolname,
      required String password,
      required String conPassword}) async {
    try {
      final response = await DioHelper.post(EndPoints.register, body: {
        'name': name,
        'phone': phone,
        'password': password,
        'password_confirmation': conPassword,
      }, headers: {
        'Accept': 'application/json',
      });

      if (response.statusCode == 200 && response.data['status'] == 'success') {
        print("Success RegisterRepo");
        print(response);
        return Right(UserModel.fromJson(jsonDecode(response.toString())));
      } else {
        print(response);
        return Left('حدث خطا فى تسجيل الحساب');
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e).errMessage);
      }
      return Left(e.toString());
    }
  }
}
