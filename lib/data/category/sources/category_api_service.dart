import 'package:blog_app/core/constants/app_api_strings.dart';
import 'package:blog_app/core/network/dio_client.dart';
import 'package:blog_app/data/category/model/update_category.dart';
import 'package:blog_app/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../model/add_category.dart';

abstract class CategoryApiService {
  Future<Either> getCategory();
  Future<Either> addcategory(AddCategoryModel addCategoryModel);
  Future<Either> deleteCategory(String id);
  Future<Either> updateCategory(UpdateCategoryModel updateCategoryModel);
}

class CategoryApiServiceImpl extends CategoryApiService {
  @override
  Future<Either> getCategory() async {
    try {
      var response = await sl<DioClient>().get(AppApiStrings.categories);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> addcategory(AddCategoryModel addCategoryModel) async {
    try {
      var response = await sl<DioClient>().post(
        AppApiStrings.addCategory,
        data: addCategoryModel.toMap(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> deleteCategory(String id) async {
    try {
      var response = await sl<DioClient>().post(
        "${AppApiStrings.deleteCategory}$id",
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> updateCategory(UpdateCategoryModel updateCategoryModel) async {
    try {
      var response = await sl<DioClient>().post(AppApiStrings.updateCategory,
          data: updateCategoryModel.toMap());

      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
