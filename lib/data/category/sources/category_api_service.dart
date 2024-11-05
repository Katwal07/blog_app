import 'package:blog_app/core/constants/app_api_strings.dart';
import 'package:blog_app/core/network/dio_client.dart';
import 'package:blog_app/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class CategoryApiService {
  Future<Either> getCategory();
}

class CategoryApiServiceImpl extends CategoryApiService{
  @override
  Future<Either> getCategory() async{
    try {
      var response = await sl<DioClient>().get(AppApiStrings.categories);
      return Right(response.data);
    }on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}