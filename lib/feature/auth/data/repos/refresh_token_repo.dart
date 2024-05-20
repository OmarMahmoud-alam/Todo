// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:todoapp/core/failure/server_failure.dart';
import 'package:todoapp/core/utils/dio_helper/app_endpoints.dart';
import 'package:todoapp/core/utils/dio_helper/dio_helper.dart';
import 'package:todoapp/core/utils/storage/shared_preference.dart';
import 'package:todoapp/feature/auth/data/models/user.dart';

class RefreshTokenRepo {
  static Future<Either<String, UserModel>> getrefreshtoken(
      String email, String password) async {
    try {
      final response = await DioHelper.post(EndPoints.refreshtoken,
          body: {},
          headers: {
            'Accept': 'application/json',
            'token': 'Bearer ${Preference.getString('token')}'
          });

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
