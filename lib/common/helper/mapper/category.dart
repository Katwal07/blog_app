import 'package:blog_app/data/category/model/category.dart';

import '../../../domain/category/entity/category.dart';

class CategoryMapper {
  static CategoryEntity toEntity(CategoryModel category) {
    return CategoryEntity(
      id: category.id,
      title: category.title,
      slug: category.slug,
      createdAt: category.createdAt,
      updatedAt: category.updatedAt,
    );
  }
}
