import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/domain/tags/repositories/tags.dart';
import 'package:blog_app/service_locator.dart';
import 'package:dartz/dartz.dart';

class GetTagsUsecase extends UseCase<Either,dynamic>{
  @override
  Future<Either> call({params}) async{
    return await sl<TagsRepository>().getTags();
  }
}