import 'package:blog_app/core/constants/app_api_strings.dart';
import 'package:blog_app/core/network/dio_client.dart';
import 'package:blog_app/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class PostApiService {
    Future<Either> getPost();
}

class PostApiServiceImpl extends PostApiService{
  @override
  Future<Either> getPost() async{
    try {
      var response = await sl<DioClient>().get(AppApiStrings.post);
      return Right(response.data);
    }on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}