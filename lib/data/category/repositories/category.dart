import 'package:blog_app/common/helper/mapper/category.dart';
import 'package:blog_app/data/category/model/category.dart';
import 'package:blog_app/data/category/sources/category_api_service.dart';
import 'package:blog_app/domain/category/repositories/category.dart';
import 'package:blog_app/service_locator.dart';
import 'package:dartz/dartz.dart';

class CategoryRepositoryImpl extends CategoryRepository{
  @override
  Future<Either> getCategory() async{
    var returnedData = await sl<CategoryApiService>().getCategory();
    return returnedData.fold(
      (error){
        return Left(error);
      }, 
      (data){
        var categories = List.from(data["categories"]).map((item)=> CategoryMapper.toEntity(CategoryModel.fromJson(item))).toList();
        return Right(categories);
      }
    );
  }
}