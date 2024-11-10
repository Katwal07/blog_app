import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/data/category/model/update_category.dart';
import 'package:blog_app/domain/category/repositories/category.dart';
import 'package:blog_app/service_locator.dart';
import 'package:dartz/dartz.dart';

class UpdateCategoryUsecase extends UseCase<Either,UpdateCategoryModel>{
  @override
  Future<Either> call({UpdateCategoryModel ? params}) async{
    return await sl<CategoryRepository>().updateCategory(params!);
  }
}