import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/domain/tags/repositories/tags.dart';
import 'package:blog_app/service_locator.dart';
import 'package:dartz/dartz.dart';

import '../../../data/tags/models/add_tags.dart';

class AddTagsUsecase extends UseCase<Either,AddTagsModel>{
  @override
  Future<Either> call({AddTagsModel ? params}) async{
    return await sl<TagsRepository>().addTags(params!);
  }
}