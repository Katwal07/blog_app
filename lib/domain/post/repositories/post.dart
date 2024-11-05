import 'package:dartz/dartz.dart';

abstract class PostRepository{
  Future<Either> getPost();
}