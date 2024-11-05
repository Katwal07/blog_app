import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/domain/category/repositories/category.dart';
import 'package:blog_app/service_locator.dart';
import 'package:dartz/dartz.dart';

class GetCategoryUsecase extends UseCase<Either,dynamic>{
  @override
  Future<Either> call({params}) async{
    return await sl<CategoryRepository>().getCategory();
  }
}