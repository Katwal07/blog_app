import 'package:blog_app/data/tags/models/update_tags.dart';
import 'package:dartz/dartz.dart';
import '../../../data/tags/models/add_tags.dart';

abstract class TagsRepository{
  Future<Either> getTags();
  Future<Either> addTags(AddTagsModel addTagsmodel);
  Future<Either> deleteTags(String id);
  Future<Either> updateTags(UpdateTagsModel updateTagsModel);
}