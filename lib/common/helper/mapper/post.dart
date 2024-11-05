import 'package:blog_app/data/post/model/post.dart';
import 'package:blog_app/domain/post/entity/post.dart';

class PostMapper {
  static PostEntity toEntity(PostModel post) {
    return PostEntity(
      id: post.id,
      name: post.name,
      email: post.email,
      emailVerifiedAt: post.emailVerifiedAt,
      currentTeamId: post.currentTeamId,
      profilePhotoPath: post.profilePhotoPath,
      about: post.about,
      createdAt: post.createdAt,
      updatedAt: post.updatedAt,
      userId: post.userId,
      title: post.title,
      slug: post.slug,
      featuredimage: post.featuredimage,
      body: post.body,
      status: post.status,
      like: post.like,
      dislike: post.dislike,
      views: post.views,
      profilePhotoUrl: post.profilePhotoUrl,
    );
  }
}
