import 'package:blog_app/data/tags/models/tags.dart';
import 'package:blog_app/domain/tags/entity/tags.dart';

class TagsMapper {
  static TagsEntity toEntity(TagsModel tags) {
    return TagsEntity(
      id: tags.id,
      title: tags.title,
      slug: tags.slug,
      createdAt: tags.createdAt,
      updatedAt: tags.updatedAt,
    );
  }
}
