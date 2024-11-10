import 'package:blog_app/core/constants/app_api_strings.dart';
import 'package:blog_app/core/network/dio_client.dart';
import 'package:blog_app/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../model/add_post.dart';

abstract class PostApiService {
    Future<Either> getPost();
    Future<Either> getUserPost();
    Future<Either> addPost(AddPostModel model);
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
  
  @override
  Future<Either> getUserPost() async{
    try {
      var response = await sl<DioClient>().get(AppApiStrings.userPost);
      return Right(response.data);
    }on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
  
  @override
  Future<Either> addPost(AddPostModel model) async{
    try {
      var response = await sl<DioClient>().post(AppApiStrings.addPost,
      data: model.toMap(),
      );
      return Right(response.data);
    }on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}