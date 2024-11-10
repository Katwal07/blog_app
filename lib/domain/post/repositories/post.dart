import 'package:blog_app/data/post/model/add_post.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepository{
  Future<Either> getPost();
  Future<Either> getUserDetails();
  Future<Either> addPost(AddPostModel model);
}