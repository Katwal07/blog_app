import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/data/category/model/add_category.dart';
import 'package:blog_app/domain/category/repositories/category.dart';
import 'package:blog_app/service_locator.dart';
import 'package:dartz/dartz.dart';

class AddCategoryUsecase extends UseCase<Either,AddCategoryModel>{
  @override
  Future<Either> call({AddCategoryModel ? params}) async{
    return await sl<CategoryRepository>().addCategory(params!);
  }
}