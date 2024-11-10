import 'package:blog_app/data/post/model/user_details.dart';
import 'package:blog_app/domain/post/entity/user_details.dart';

class UserDetailsMapper {
  static UserDetailsEntity toEntity(UserDetailsModel models) {
    return UserDetailsEntity(
      id: models.id,
      name: models.name,
      email: models.email,
      emailVerifiedAt: models.emailVerifiedAt,
      currentTeamId: models.currentTeamId,
      profilePhotoPath: models.profilePhotoPath,
      about: models.about,
      createdAt: models.createdAt,
      updatedAt: models.updatedAt,
      profilePhotoUrl: models.profilePhotoUrl,
    );
  }
}
