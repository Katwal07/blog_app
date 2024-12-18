import 'package:blog_app/common/helper/mapper/post.dart';
import 'package:blog_app/common/helper/mapper/user_details.dart';
import 'package:blog_app/data/post/model/add_post.dart';
import 'package:blog_app/data/post/model/post.dart';
import 'package:blog_app/data/post/model/user_details.dart';
import 'package:blog_app/data/post/sources/post_api_service.dart';
import 'package:blog_app/domain/post/repositories/post.dart';
import 'package:blog_app/service_locator.dart';
import 'package:dartz/dartz.dart';

class PostRepositoryImpl extends PostRepository {
  @override
  Future<Either> getPost() async {
    var returnedData = await sl<PostApiService>().getPost();
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var post = List.from(data['all_posts'])
          .map((item) => PostMapper.toEntity(PostModel.fromJson(item)))
          .toList();
      return Right(post);
    });
  }

  @override
  Future<Either> getUserDetails() async {
    var returnedData = await sl<PostApiService>().getUserPost();
    return returnedData.fold((error) {
      return const Left("error");
    }, (data) {
      var userPost = UserDetailsMapper.toEntity(
          UserDetailsModel.fromJson(data['user_details']));
      return Right(userPost);
    });
  }

  @override
  Future<Either> addPost(AddPostModel model) async {
    var returnedData = await sl<PostRepository>().addPost(model);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(data);
    });
  }
}
