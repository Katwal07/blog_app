import 'package:blog_app/core/constants/app_api_strings.dart';
import 'package:blog_app/core/network/dio_client.dart';
import 'package:blog_app/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../models/add_tags.dart';
import '../models/update_tags.dart';

abstract class TagsApiService {
  Future<Either> getTags();
  Future<Either> addTags(AddTagsModel addTagsmodel);
  Future<Either> deleteTags(String id);
  Future<Either> updateTags(UpdateTagsModel updateTagsModel);
}

class TagsApiServiceImpl extends TagsApiService {
  @override
  Future<Either> getTags() async{
    try {
      var response =await sl<DioClient>().get(AppApiStrings.tags);
      return Right(response.data);
    }on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> addTags(AddTagsModel addTagsmodel) async{
    try {
      var response = await sl<DioClient>().post(AppApiStrings.addTags,
      data: addTagsmodel.toMap(),
      );
      return Right(response.data);
    }on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
  
  @override
  Future<Either> updateTags(UpdateTagsModel updateTagsModel) async{
    try {
      var response = await sl<DioClient>().post(AppApiStrings.updateTags,
      data: updateTagsModel.toMap(),
      );
      return Right(response.data);
    }on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
  
  @override
  Future<Either> deleteTags(String id) async{
    try {
      var response = await sl<DioClient>().post("${AppApiStrings.deleteTags}$id");
      return Right(response.data);
    }on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
