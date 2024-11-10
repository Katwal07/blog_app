class UserDetailsEntity {
    UserDetailsEntity({
        required this.id,
        required this.name,
        required this.email,
        required this.emailVerifiedAt,
        required this.currentTeamId,
        required this.profilePhotoPath,
        required this.about,
        required this.createdAt,
        required this.updatedAt,
        required this.profilePhotoUrl,
    });

    final int? id;
    final String? name;
    final String? email;
    final dynamic emailVerifiedAt;
    final dynamic currentTeamId;
    final dynamic profilePhotoPath;
    final dynamic about;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final String? profilePhotoUrl;
}
