import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/domain/tags/repositories/tags.dart';
import 'package:blog_app/service_locator.dart';
import 'package:dartz/dartz.dart';

class DeleteTagsUsecase extends UseCase<Either, String>{
  @override
  Future<Either> call({String ? params}) async{
    return await sl<TagsRepository>().deleteTags(params!);
  }
}