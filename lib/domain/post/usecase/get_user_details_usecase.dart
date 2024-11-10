import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/domain/post/repositories/post.dart';
import 'package:blog_app/service_locator.dart';
import 'package:dartz/dartz.dart';

class GetUserDetailsUsecase extends UseCase<Either,dynamic>{
  @override
  Future<Either> call({params}) async{
    return await sl<PostRepository>().getUserDetails();
  }
}