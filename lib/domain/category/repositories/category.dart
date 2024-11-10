import 'package:blog_app/data/category/model/add_category.dart';
import 'package:blog_app/data/category/model/update_category.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryRepository{
  Future<Either> getCategory();
  Future<Either> addCategory(AddCategoryModel addCategoryModel);
  Future<Either> deleteCategory(String id);
  Future<Either> updateCategory(UpdateCategoryModel updateCategoryModel);
}