import 'package:blog_app/core/constants/app_api_strings.dart';
import 'package:blog_app/core/network/dio_client.dart';
import 'package:blog_app/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http_parser/http_parser.dart';


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
       final String fileExtension =
          model.featuredimage!.path.split('.').last.toLowerCase();
      if (!['jpg', 'jpeg', 'png', 'webp'].contains(fileExtension)) {
        return const Left(
            'Invalid file type. Please use JPG, PNG or WebP images.');
      }

      FormData formData = FormData.fromMap({
        'title': model.title,
        'slug': model.slug,
        'categories': model.categories,
        'tags': model.tags,
        'status': model.status,
        'featuredimage': await MultipartFile.fromFile(
          model.featuredimage!.path,
          filename: model.featuredimage!.path.split('/').last,
          contentType: MediaType('featuredImage', fileExtension)
        ),
        'userId': model.userId,
      });

      debugPrint('Form data fields:');
      for (var field in formData.fields) {
        debugPrint('${field.key}: ${field.value}');
      }
      debugPrint('Form data files:');
      for (var file in formData.files) {
        debugPrint('${file.key}: ${file.value.filename}');
      }

      debugPrint('Request data: ${formData.fields}');
      debugPrint('Files: ${formData.files}');
      var response = await sl<DioClient>().post(AppApiStrings.addPost,
      data: model.toMap(),
      );
      return Right(response.data);
    }on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}