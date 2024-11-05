import 'package:blog_app/core/constants/app_api_strings.dart';
import 'package:blog_app/core/network/dio_client.dart';
import 'package:blog_app/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../model/signin_req_params.dart';
import '../model/signup_req_params.dart';

abstract class AuthApiService {
  Future<Either> register(SignupReqParams params);
  Future<Either> login(SigninReqParams params);
}

class AuthApiServiceImpl extends AuthApiService {
  @override
  Future<Either> login(SigninReqParams params) async {
    try {
      var response = await sl<DioClient>().post(
        AppApiStrings.login,
        data: params.toMap(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> register(SignupReqParams params) async {
    try {
      var response = await sl<DioClient>().post(
        AppApiStrings.register,
        data: params.toMap(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
