import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/domain/post/repositories/post.dart';
import 'package:blog_app/service_locator.dart';
import 'package:dartz/dartz.dart';

import '../../../data/post/model/add_post.dart';

class AddPostUsecase extends UseCase<Either,AddPostModel>{
  @override
  Future<Either> call({AddPostModel ? params}) async{
    return await sl<PostRepository>().addPost(params!);
  }
}