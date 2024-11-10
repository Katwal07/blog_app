import 'package:blog_app/common/helper/mapper/tags.dart';
import 'package:blog_app/data/tags/models/add_tags.dart';
import 'package:blog_app/data/tags/models/tags.dart';
import 'package:blog_app/data/tags/models/update_tags.dart';
import 'package:blog_app/data/tags/sources/tags_api_service.dart';
import 'package:blog_app/domain/tags/repositories/tags.dart';
import 'package:blog_app/service_locator.dart';
import 'package:dartz/dartz.dart';

class TagsRepositoryImpl extends TagsRepository {
  @override
  Future<Either> getTags() async {
    var returnedData = await sl<TagsApiService>().getTags();
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var tags = List.from(data["tags"])
          .map((items) => TagsMapper.toEntity(TagsModel.fromJson(items)))
          .toList();
      return Right(tags);
    });
  }

  @override
  Future<Either> addTags(AddTagsModel addTagsmodel) async {
    var returnedData = await sl<TagsApiService>().addTags(addTagsmodel);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(data);
    });
  }

  @override
  Future<Either> updateTags(UpdateTagsModel updateTagsModel) async {
    var returnedData = await sl<TagsApiService>().updateTags(updateTagsModel);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(data);
    });
  }
  
  @override
  Future<Either> deleteTags(String id) async{
    var returnedData = await sl<TagsApiService>().deleteTags(id);
    return returnedData.fold(
      (error){
        return Left(error);
      }, 
      (data){
        return Right(data);
      }
    );
  }
}
