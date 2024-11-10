import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/data/tags/models/update_tags.dart';
import 'package:blog_app/domain/tags/repositories/tags.dart';
import 'package:blog_app/service_locator.dart';
import 'package:dartz/dartz.dart';

class UpdateTagsUsecase extends UseCase<Either, UpdateTagsModel>{
  @override
  Future<Either> call({UpdateTagsModel ? params}) async{
    return await sl<TagsRepository>().updateTags(params!);
  }
}